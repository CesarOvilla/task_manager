import 'dart:convert';

TaskBasicModel taskBasicModelFromJson(String str) =>
    TaskBasicModel.fromJson(json.decode(str));

class TaskBasicModel {
  TaskBasicModel({
    required this.id,
    required this.title,
    required this.isCompleted,
    this.dueDate,
  });

  final int id;
  final String title;
  final int isCompleted;
  final DateTime? dueDate;

  factory TaskBasicModel.fromJson(Map<String, dynamic> json) => TaskBasicModel(
        id: json["id"],
        title: json["title"],
        isCompleted: json["is_completed"],
        dueDate:
            json["due_date"] != null ? DateTime.parse(json["due_date"]) : null,
      );
}
