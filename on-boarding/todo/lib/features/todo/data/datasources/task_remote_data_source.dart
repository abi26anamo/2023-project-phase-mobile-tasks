import 'dart:convert';
import 'package:layout_task/core/errors/exception.dart';
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

  TaskRemoteDataSourceImpl({required this.client});

  @override
  Future<TodoModel> createTask(TodoModel task) async {
    final response = await client.post(
      Uri.parse("https://jsonplaceholder.typicode.com/todos"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(task.toJson()),
    );

    if (response.statusCode == 201) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TodoModel>> getAllTasks() async {
    final response = await client.get(
      Uri.parse("https://jsonplaceholder.typicode.com/todos"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final tasks = json.decode(response.body) as List;
      return tasks.map((task) => TodoModel.fromJson(task)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TodoModel> getTask(id) async {
    final response = await client.get(
      Uri.parse("https://jsonplaceholder.typicode.com/todos/$id"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteTask(int id) async {
    final response = await client.delete(
      Uri.parse("https://jsonplaceholder.typicode.com/todos/$id"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<TodoModel> updateTask(int id) async {
    final response = await client.put(
      Uri.parse("https://jsonplaceholder.typicode.com/todos/$id"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "completed": true,
        "title": "delectus aut autem",
        "userId": 1
      }),
    );

    if (response.statusCode == 200) {
      return TodoModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
