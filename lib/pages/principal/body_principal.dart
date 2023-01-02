import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/pages/principal/task_information_alert_dialog.dart';
import 'package:task_manager/provider/principal_provider.dart';
import 'package:task_manager/widgets/card_task.dart';

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
      child: Obx(
        () => provider.tasks.value != null
            ? ListView.builder(
                itemCount: provider.tasks.value!.length,
                itemBuilder: (context, index) {
                  return CardTask(
                    color: provider.tasks.value![index].isCompleted == 1
                        ? Colors.greenAccent
                        : Colors.yellowAccent,
                    taskName: provider.tasks.value![index].title,
                    date: provider.tasks.value![index].dueDate.toString(),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return TaskInformationAlertDialog(
                            task: provider.tasks.value![index],
                          );
                        },
                      );
                    },
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
