import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/features/presentation/pages/create_task_page.dart';
import 'package:layout_task/features/presentation/pages/task_list_page.dart';
import 'package:layout_task/features/presentation/widgets/task_card.dart';

void main() {
  group("task todo list test", () {
    testWidgets('Test Task Listing', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: TodoListPage()));

      expect(find.byType(TodoListPage), findsOneWidget);

      expect(find.text("Tasks List"), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(GestureDetector), findsWidgets);
      expect(find.byType(Icon), findsWidgets);
      expect(find.byType(TaskCard), findsWidgets);
    });

    testWidgets('TaskListItem Navigation Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TaskCard(
            iconColor: Colors.black,
            text: "U",
            title: "Football",
            subtitle: "Dribbling",
            date: "April 29,2023",
            color: Colors.redAccent,
          ),
        ),
      );
    });

    testWidgets('TaskListItem Navigation Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: TaskCard(
            iconColor: Colors.black,
            text: "U",
            title: "UI/UX APP",
            subtitle: "Design",
            date: "April 29,2023",
            color: Colors.redAccent,
          ),
        ),
      );
    });
  });

  testWidgets("navigation to create new task", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TodoListPage(),
      routes: {
        '/create_new_task': (context) => CreateNewTask(),
      },
    ));

    await tester.tap(find.text('Create Task'));
    await tester.pumpAndSettle();

    expect(find.text('Create New Task'), findsOneWidget);
    expect(find.byType(CreateNewTask), findsOneWidget);

    await tester.tap(find.byIcon(Icons.chevron_left));
    await tester.pumpAndSettle();

    expect(find.text('Tasks List'), findsOneWidget);
  });
}
