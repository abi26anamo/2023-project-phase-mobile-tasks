import 'package:flutter/material.dart';

class TaskDetail extends StatefulWidget {
  final String title;
  final String description;
  final String deadline;

  TaskDetail({
    required this.title,
    required this.description,
    required this.deadline,
  });

  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _deadlineController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _descriptionController = TextEditingController(text: widget.description);
    _deadlineController = TextEditingController(text: widget.deadline);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
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
                    'Create New Task',
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
            SizedBox(
              height: 20,
            ),
            Text(
              'Title',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              width: double.infinity,
              height: 40,
              child: TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Description',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              width: 356,
              height: 100,
              alignment: Alignment.center,
              child: TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                maxLines: 3,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Deadline',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              width: double.infinity,
              height: 40,
              child: TextFormField(
                controller: _deadlineController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
