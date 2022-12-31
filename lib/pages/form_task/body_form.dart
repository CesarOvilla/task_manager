import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/provider/form_task_provider.dart';
import 'package:task_manager/widgets/checkbox_custom.dart';
import 'package:task_manager/widgets/link_text.dart';
import 'package:task_manager/widgets/text_custom.dart';
import 'package:task_manager/widgets/textfield_custom.dart';

class BodyForm extends StatelessWidget {
  const BodyForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FormTaskProvider provider = Get.find();
    return Form(
      key: provider.keyForm,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFieldCustom(
            labelText: 'Task name',
            hintText: 'Task name',
            validate: true,
            controller: provider.taskNameText,
          ),
          TextFieldCustom(
            labelText: 'Date',
            hintText: 'date',
            controller: provider.dateText,
          ),
          Obx(
            () => CheckboxCustom(
              value: provider.complete.value,
              onChanged: provider.changeComplete,
              text: "Complete",
            ),
          ),
          Obx(
            () => provider.moreOption.value
                ? ZoomIn(
                    animate: provider.moreOption.value,
                    child: Column(
                      children: [
                        TextFieldCustom(
                          labelText: 'Comentarios',
                          hintText: 'Comentarios',
                          controller: provider.commentText,
                        ),
                        TextFieldCustom(
                          labelText: 'Description',
                          hintText: 'Description',
                          controller: provider.descriptionText,
                        ),
                        TextFieldCustom(
                          labelText: 'TAG',
                          hintText: 'tags',
                          controller: provider.tagText,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ),
          Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              alignment: Alignment.centerRight,
              child: LinkText(
                  text:
                      provider.moreOption.value ? 'less option' : 'more option',
                  onTap: () {
                    provider.changeOption(!provider.moreOption.value);
                  }),
            ),
          )
        ],
      ),
    );
  }
}
