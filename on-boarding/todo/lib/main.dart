import 'package:flutter/material.dart';

import 'features/todo/presentation/pages/create_task_page.dart';
import 'features/todo/presentation/pages/onboarding_page.dart';
import 'features/todo/presentation/pages/task_list_page.dart';


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
