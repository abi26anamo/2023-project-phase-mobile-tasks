import 'package:layout_task/features/todo/domain/entities/task.dart';

import '../models/todo_model.dart';

abstract class TaskLocalDataSource{
  Future<TodoTask> getLastTask();

  Future<void> cacheTask(TodoModel taskToCache);

  Future<void> cacheAllTask(List<TodoModel> taskToCache);

  Future<List<TodoTask>> getAllCachedTasks();

}