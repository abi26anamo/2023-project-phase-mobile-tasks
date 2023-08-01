enum status { completed, pending }

class Task {
  String title;
  String description;
  DateTime dueDate;
  status taskStatus;
 
  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.taskStatus,
  });
}
