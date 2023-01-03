import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/pages/principal/task_information_alert_dialog.dart';
import 'package:task_manager/provider/principal_provider.dart';
import 'package:task_manager/utils/color_app.dart';
import 'package:task_manager/widgets/card_task.dart';
import 'package:task_manager/widgets/text_custom.dart';

class BodyPrincipal extends GetView<PrincipalProvider> {
  const BodyPrincipal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PrincipalProvider provider = Get.find();
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _Indicators(
                  color: ColorApp.cardTaskComplete,
                  text: 'Completed',
                ),
                _Indicators(
                  color: ColorApp.cardTaskNoComplete,
                  text: 'Not Completed',
                ),
              ],
            ),
          ),
          Divider(),
          Obx(
            () => provider.tasks.value != null
                ? Expanded(
                    child: provider.tasks.value!.isNotEmpty
                        ? ListView.builder(
                            itemCount: provider.tasks.value!.length,
                            itemBuilder: (context, index) {
                              return CardTask(
                                color:
                                    provider.tasks.value![index].isCompleted ==
                                            1
                                        ? ColorApp.cardTaskComplete
                                        : ColorApp.cardTaskNoComplete,
                                taskName: provider.tasks.value![index].title,
                                date: provider.tasks.value![index].dueDate
                                    .toString(),
                                onTap: () {
                                  provider
                                      .getTaskId(
                                    id: provider.tasks.value![index].id!,
                                  )
                                      .then(
                                    (value) {
                                      if (value != null) {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return TaskInformationAlertDialog(
                                              task: value,
                                            );
                                          },
                                        );
                                      }
                                    },
                                  );
                                },
                              );
                            },
                          )
                        : Center(
                            child: TextCustom(
                            'No tasks',
                            fontSize: 25,
                            colorFont: ColorApp.hinttextTextfield,
                          )),
                  )
                : const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _Indicators extends StatelessWidget {
  const _Indicators({Key? key, required this.color, required this.text})
      : super(key: key);

  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: TextCustom(text),
        )
      ],
    );
  }
}
