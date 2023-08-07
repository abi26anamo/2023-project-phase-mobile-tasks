import 'package:flutter/material.dart';
import 'package:layout_task/create_new_task.dart';
import 'package:layout_task/home.dart';
import 'package:layout_task/task_detail.dart';
import 'package:layout_task/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
      initialRoute: '/',
      routes: {
        '/create_new_task': (context) => CreateNewTask(),
        '/todo_list': (context) => TodoListPage(),
      },
    );
  }
}
