import 'dart:convert';

import 'package:layout_task/core/errors/exception.dart';
import 'package:layout_task/features/todo/domain/entities/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo_model.dart';

const CACHED_TASK = 'CACHED_TASK';

abstract class TaskLocalDataSource {
  Future<TodoTask> getLastTask();

  Future<void> cacheTask(TodoModel taskToCache);

  Future<void> cacheAllTask(List<TodoModel> taskToCache);

  Future<List<TodoTask>> getAllCachedTasks();
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<TodoTask> getLastTask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(CACHED_TASK);

    if (jsonString != null) {
      return Future.value(TodoModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheTask(TodoModel taskToCache) {
    return sharedPreferences.setString(
      CACHED_TASK,
      json.encode(
        taskToCache.toJson(),
      ),
    );
  }
  
  @override
  Future<void> cacheAllTask(List<TodoModel> taskToCache) {
    throw UnimplementedError();
  }
  
  @override
  Future<List<TodoTask>> getAllCachedTasks() {
    throw UnimplementedError();
  }

}
