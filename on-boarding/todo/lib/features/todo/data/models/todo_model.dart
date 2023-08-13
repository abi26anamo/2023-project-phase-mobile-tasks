import 'package:layout_task/features/todo/domain/entities/task.dart';

class TodoModel extends TodoTask {
  TodoModel({
    required super.id,
    required super.text,
    required super.title,
    required super.subtitle,
    required super.date,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      text: json['text'],
      title: json['title'],
      subtitle: json['subtitle'],
      date: json['date'],
    );
  }  

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'title': title,
      'subtitle': subtitle,
      'date': date,
    };
  }


}
