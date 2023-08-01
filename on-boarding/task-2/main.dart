import 'task.dart';
import 'task_manager.dart';

void main() {
  TaskManager taskManager = TaskManager();
  var task1 = Task(
      title: "Task 1",
      description: "This is task 1",
      dueDate: DateTime.now(),
      taskStatus: status.completed);
  taskManager.addTask(task1);
  var task2 = Task(
      title: "Task 2",
      description: "This is task 2",
      dueDate: DateTime.now(),
      taskStatus: status.pending);
  taskManager.addTask(task2);

  taskManager.viewAllTasks();
  taskManager.viewCompletedTasks();
  taskManager.viewPendingTasks();

  taskManager.editTask(task1, "Task 1 edited", "This is task 1 edited",
      DateTime.now().add(Duration(days: 1)));

  taskManager.deleteTask(task2);
}
