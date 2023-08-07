import 'package:flutter/material.dart';
import 'task_detail.dart';

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskDetail(
                                title: "UI/UX APP Design",
                                description: "This is the main task...",
                                deadline: "April 20,2023",
                              ),
                            ),
                          );
                        },
                        child: TaskListItem(
                          iconColor: Colors.black,
                          text: "U",
                          title: "UI/UX APP",
                          subtitle: "Design",
                          date: "April 29,2023",
                          color: Colors.redAccent,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskDetail(
                                title: "UI/UX APP Design",
                                description: "This is the main task...",
                                deadline: "April 20,2023",
                              ),
                            ),
                          );
                        },
                        child: TaskListItem(
                          iconColor: Colors.black,
                          text: "U",
                          title: "UI/UX APP",
                          subtitle: "Design",
                          date: "April 29,2023",
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskDetail(
                                title: "View candidates",
                                description: "This task is about view candidates description for me to complete the task",
                                deadline: "April 22,2023",
                              ),
                            ),
                          );
                        },
                        child: TaskListItem(
                          iconColor: Colors.black,
                          text: "V",
                          title: "View candidates",
                          subtitle: "",
                          date: "April 29,2023",
                          color: Colors.yellow,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskDetail(
                                title: "Football Dribbling",
                                description: "This task is about football dribbling that helps us to complete the task",
                                deadline: "April 12,2023",
                              ),
                            ),
                          );
                        },
                        child: TaskListItem(
                          iconColor: Colors.black,
                          text: "U",
                          title: "Football",
                          subtitle: "Dribbling",
                          date: "April 29,2023",
                          color: Colors.redAccent,
                        ),
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
                                Navigator.pushNamed(context, '/create_new_task');
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

class TaskListItem extends StatelessWidget {
  final Color iconColor;
  final String text;
  final String title;
  final String subtitle;
  final String date;
  final Color color;

  TaskListItem({
    required this.iconColor,
    required this.text,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(31, 170, 168, 168),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
          BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15),
                Text(
                  text,
                  style: TextStyle(
                    color: iconColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  height: 35,
                  width: 3,
                  decoration: BoxDecoration(
                    color: color,
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

