import 'package:layout_task/features/todo/data/models/todo_model.dart';
import 'package:http/http.dart' as http;

abstract class TaskRemoteDataSource {
  Future<List<TodoModel>> getAllTasks();

  Future<TodoModel> getTask(int id);

  Future<TodoModel> createTask(TodoModel task);

  Future<TodoModel> updateTask(int id); 

  Future<void> deleteTask(int id);
}

class TaskRemoteDataSourceImpl extends TaskRemoteDataSource {
  final http.Client client;

  TaskRemoteDataSourceImpl({ required this.client}); 

  @override
  Future<TodoModel> createTask(TodoModel task) {
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getAllTasks() {
    throw UnimplementedError();
  }

  @override
  Future<TodoModel> getTask(id) {
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteTask(int id) {
    throw UnimplementedError();
  }
  
  @override
  Future<TodoModel> updateTask(int id) {
    throw UnimplementedError();
  }
}
