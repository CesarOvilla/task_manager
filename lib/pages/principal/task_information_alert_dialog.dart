import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/provider/principal_provider.dart';
import 'package:task_manager/utils/color_app.dart';
import 'package:task_manager/widgets/elevatedbutton_custom.dart';
import 'package:task_manager/widgets/text_custom.dart';

class TaskInformationAlertDialog extends StatelessWidget {
  const TaskInformationAlertDialog({
    Key? key,
    required this.task,
    // required this.registerData,
  }) : super(key: key);

  // final RegisterData registerData;
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final PrincipalProvider provider = Get.find();
    final width = Get.width * 0.7;
    final height = Get.height * 0.45;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Center(
        child: TextCustom('Task'),
      ),
      content: SizedBox(
        height: height,
        width: width,
        child: Card(
          elevation: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _DescriptionEvent(
                icon: Icons.book,
                title: 'Task name: ',
                subtitle: task.title,
              ),
              _DescriptionEvent(
                icon: Icons.calendar_month,
                title: 'Date: ',
                subtitle: task.dueDate ?? 'unspecified',
              ),
              _DescriptionEvent(
                icon: Icons.check,
                title: 'Complete: ',
                subtitle: task.isCompleted == 1 ? 'true' : 'false',
              ),
              _DescriptionEvent(
                icon: Icons.comment,
                title: 'Comments: ',
                subtitle: task.comments ?? 'unspecified',
              ),
              _DescriptionEvent(
                icon: Icons.description,
                title: 'Description: ',
                subtitle: task.description ?? 'unspecified',
              ),
              _DescriptionEvent(
                icon: Icons.tag,
                title: 'Tags: ',
                subtitle: task.tags ?? 'unspecified',
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButtonCustom(
          width: Get.width * 0.3,
          height: Get.height * 0.05,
          text: 'Editar',
          primaryColor: Colors.blueAccent,
          function: () {
            Get.toNamed('/formTask', arguments: task)!
                .whenComplete(() => Get.back());
            // Get.back();
          },
        ),
        ElevatedButtonCustom(
          width: Get.width * 0.3,
          height: Get.height * 0.05,
          text: 'Eliminar',
          primaryColor: Colors.redAccent,
          function: () {
            provider.deleteTask(id: task.id!);
            Get.back();
            // registerDataProvider.deleteDato(registerData);
            // Get.back();
            // Get.toNamed('/principal');
          },
        )
      ],
    );
  }
}

class _DescriptionEvent extends StatelessWidget {
  const _DescriptionEvent({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCustom(
                title,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              TextCustom(
                subtitle,
                fontSize: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
