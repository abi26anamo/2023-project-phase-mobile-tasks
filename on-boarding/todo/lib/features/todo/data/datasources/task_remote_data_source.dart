import 'package:layout_task/features/todo/data/models/todo_model.dart';
import 'package:layout_task/features/todo/domain/usecases/view_all_task_usecase.dart';
import 'package:layout_task/features/todo/domain/usecases/view_single_task.dart';

abstract class TaskRemoteDataSource {
  
  Future<List<TodoModel>> ViewAllTasks();

  Future<TodoModel> ViewTask(id);

  Future<TodoModel> CreateTask(TodoModel task);
  
}