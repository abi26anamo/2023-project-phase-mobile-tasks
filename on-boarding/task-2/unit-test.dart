import 'package:test/test.dart';
import 'task.dart';
import 'task_manager.dart';

void main() {
  group('TaskManager', () {
    late TaskManager taskManager;

    setUp(() {
      taskManager = TaskManager();
      taskManager.addTask(Task(
        title: 'Task 1',
        description: 'Description 1',
        dueDate: DateTime.now(),
        taskStatus: status.completed,
      ));
    });

    test('getTaskByTitle returns the correct task', () {
      Task? task = taskManager.getTaskByTitle('Task 1');
      expect(task?.title, equals('Task 1'));
      expect(task?.description, equals('Description 1'));
    });

    test('getTaskByTitle returns null for invalid title', () {
      Task? task = taskManager.getTaskByTitle('Task 3');
      expect(task, equals(null));
    });
  });
}
