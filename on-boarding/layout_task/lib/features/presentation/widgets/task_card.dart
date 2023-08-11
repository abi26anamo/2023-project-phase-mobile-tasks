import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Color iconColor;
  final String text;
  final String title;
  final String subtitle;
  final String date;
  final Color color;
  final bool isCompleted;
  final Function(bool) onCompleteChanged;

  TaskCard({
    required this.iconColor,
    required this.text,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.color,
    required this.isCompleted,
    required this.onCompleteChanged,
  });

  @override
  Widget build(BuildContext context) {
    final taskColor = Colors.white;
    final textColor = Colors.black;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
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
          color: taskColor,
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
                        color: textColor,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: textColor,
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
                    color: textColor,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  height: 35,
                  width: 3,
                  decoration: BoxDecoration(
                    color: isCompleted ? Colors.red : Colors.yellowAccent,
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
