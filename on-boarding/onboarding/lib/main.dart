import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/create_new_task.dart';
import 'package:onboarding/home.dart';
import 'package:onboarding/task_detail.dart';
import 'package:onboarding/todo_list.dart';

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
    );
  }
}

