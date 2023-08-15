import 'dart:convert';
import 'package:layout_task/core/errors/exception.dart';
import 'package:layout_task/features/todo/domain/entities/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo_model.dart';

const CACHED_TASK = 'CACHED_TASK';
const CACHED_ALL_TASK = 'CACHED_ALL_TASK';

abstract class TaskLocalDataSource {
  Future<TodoTask> getTask();

  Future<void> cacheTask(TodoModel taskToCache);

  Future<void> cacheAllTask(List<TodoModel> taskToCache);

  Future<List<TodoTask>> getAllCachedTasks();

  Future<void> deleteCachedTask(int id);

  Future<void> deleteAllCachedTasks();
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<TodoTask> getTask() async {
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
  Future<void> cacheAllTask(List<TodoModel> tasksToCache) {
    return sharedPreferences.setStringList(
      CACHED_ALL_TASK,
      tasksToCache.map((e) => json.encode(e.toJson())).toList(),
    );
  }

  @override
  Future<List<TodoTask>> getAllCachedTasks() {
    final jsonString = sharedPreferences.getStringList(CACHED_ALL_TASK);
    if (jsonString != null) {
      return Future.value(
          jsonString.map((e) => TodoModel.fromJson(json.decode(e))).toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> deleteAllCachedTasks() {
    return sharedPreferences.remove(CACHED_ALL_TASK);
  }

  @override
  Future<void> deleteCachedTask(int id) {
    return sharedPreferences.remove(CACHED_TASK);
  }
}
