import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 30,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.chevron_left,
                  color: Colors.redAccent,
                  size: 30,
                ),
                Text(
                  'Task Detail',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.black,
                )
              ],
            ),
          ),
          Image.asset(
            "assets/images/shopping-list.png",
            height: 150,
            width: 150,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("UI/UX APP Design"),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  width: 356,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text("This is the main task that has to be done by today and it is UI/UX app design for the memebers of the team"),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deadline',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                  ),
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("April 20,2023"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
