import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/model/task_model.dart';
import 'package:task_manager/provider/principal_provider.dart';
import 'package:task_manager/service/sharedpreference/shared_preference_servcie.dart';

class FormTaskProvider extends GetxController {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final TextEditingController _taskNameText = TextEditingController();
  final TextEditingController _dateText = TextEditingController();
  final TextEditingController _commentText = TextEditingController();
  final TextEditingController _descriptionText = TextEditingController();
  final TextEditingController _tagText = TextEditingController();

  // final TextEditingController _fechaText = TextEditingController(
  //   text: DateFormat('yyyy-MM-dd').format(DateTime.now().toLocal()),
  // );

  final RxBool _moreOption = false.obs;
  final RxBool _complete = false.obs;

  TaskModel? taskEdit;

  RxBool get moreOption => _moreOption;
  RxBool get complete => _complete;

  GlobalKey<FormState> get keyForm => _keyForm;
  TextEditingController get taskNameText => _taskNameText;
  TextEditingController get dateText => _dateText;
  TextEditingController get commentText => _commentText;
  TextEditingController get descriptionText => _descriptionText;
  TextEditingController get tagText => _tagText;

  void loadTask({required task}) {
    taskEdit = task;
    _taskNameText.text = task.title;
    _dateText.text = task.dueDate ?? '';
    _commentText.text = task.comments ?? '';
    _descriptionText.text = task.description ?? '';
    _tagText.text = task.tags ?? '';
    _complete.value = task.isCompleted == 1 ? true : false;
    if (task.comments != null ||
        task.description != null ||
        task.tags != null) {
      _moreOption.value = true;
    }
  }

  void changeComplete(bool? value) {
    _complete.value = value!;
  }

  void changeOption(bool value) {
    _moreOption.value = value;
  }

  Future<void> saveRegister() async {
    if (_keyForm.currentState!.validate()) {
      _keyForm.currentState!.save();
      PrincipalProvider provider = Get.find();

      TaskModel task = TaskModel(
        title: _taskNameText.text,
        isCompleted: _complete.value ? 1 : 0,
        comments: _commentText.text,
        description: descriptionText.text,
        dueDate: dateText.text,
        token: SharedPreferencesService.tokenUser,
        tags: _tagText.text,
      );
      provider.addTask(task: task);
    }
  }

  Future<void> updateRegister() async {
    if (_keyForm.currentState!.validate()) {
      _keyForm.currentState!.save();
      PrincipalProvider provider = Get.find();

      TaskModel task = TaskModel(
        title: _taskNameText.text,
        isCompleted: _complete.value ? 1 : 0,
        comments: _commentText.text,
        description: descriptionText.text,
        dueDate: dateText.text,
        token: SharedPreferencesService.tokenUser,
        tags: _tagText.text,
      );
      provider.updateTask(task: task, id: taskEdit!.id!);
    }
  }
}
