import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/create_new_task.dart';
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
      // initialRoute: '/home',
      // getPages: [
      //   GetPage(name: '/todo-list', page: () => TodoListPage()),
      // ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
          ),
          Positioned(
            child: Image.asset(
              'assets/images/stick-man-canva.png',
              height: 400,
              width: 400,
            ),
            top: 50,
            left: 10,
            right: 10,
          ),
          Positioned(
            bottom: 50,
            right: 50,
            child: Container(
              width: 256,
              height: 50,
              decoration: BoxDecoration(
                color: Color.fromARGB(12, 140, 233, 1),
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Get.to(TodoListPage());
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
