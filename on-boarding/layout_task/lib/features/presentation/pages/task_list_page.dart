import 'package:flutter/material.dart';
import '../widgets/task_card.dart';
import 'task_detail_page.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<Task> tasks = [
    Task(
      title: "UI/UX APP Design",
      description: "This is the main task...",
      deadline: "April 20, 2023",
    ),
    Task(
      title: "UI/UX APP Design",
      description: "This is the main task...",
      deadline: "April 20, 2023",
    ),
    Task(
      title: "View candidates",
      description: "view candidates",
      deadline: "April 22, 2023",
    ),
    Task(
      title: "Football Dribbling",
      description: " football dribbling...",
      deadline: "April 12, 2023",
    ),
  ];

  void _updateTaskCompletion(int index, bool isCompleted) {
    setState(() {
      tasks[index].isCompleted = isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 30,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.redAccent,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Todo List',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/images/stickman.jpg",
              height: 150,
              width: 150,
            ),
            SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Tasks List",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 200),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < tasks.length; i++)
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TaskDetail(
                                      title: tasks[i].title,
                                      description: tasks[i].description,
                                      deadline: tasks[i].deadline,
                                      isCompleted: tasks[i].isCompleted,
                                      onCompleteChanged: (isCompleted) =>
                                          _updateTaskCompletion(i, isCompleted),
                                    ),
                                  ),
                                );
                              },
                              child: TaskCard(
                                iconColor: Colors.black,
                                text: "U",
                                title: tasks[i].title,
                                subtitle: tasks[i].description,
                                date: tasks[i].deadline,
                                color: Colors.white,
                                isCompleted: tasks[i].isCompleted,
                                onCompleteChanged: (isCompleted) =>
                                    _updateTaskCompletion(i, isCompleted),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 35,
                            width: 256,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(237, 111, 7, 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/create_new_task');
                              },
                              child: Text(
                                "Create Task",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  final String title;
  final String description;
  final String deadline;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.deadline,
    this.isCompleted = false,
  });
}
