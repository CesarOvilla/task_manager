import 'dart:convert';

TaskModel taskBasicModelFromJson(String str) =>
    TaskModel.fromJson(json.decode(str));

class TaskModel {
  TaskModel({
    this.id,
    required this.title,
    required this.isCompleted,
    this.dueDate,
    this.comments,
    this.description,
    this.tags,
    this.token,
  });

  final int? id;
  final String title;
  final int isCompleted;
  final String? dueDate;
  final String? comments;
  final String? description;
  final String? tags;
  final String? token;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        isCompleted: json["is_completed"],
        dueDate: json["due_date"],
        comments: json["comments"],
        description: json["description"],
        tags: json["tags"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "is_completed": isCompleted,
        "due_date": dueDate,
        "comments": comments,
        "description": description,
        "tags": tags,
        "token": token,
      };
}
