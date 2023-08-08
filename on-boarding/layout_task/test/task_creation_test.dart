import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/create_new_task.dart';
import 'package:layout_task/todo_list.dart';

void main() {
  group("creat task page", () {
    testWidgets('Test Task Creation', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CreateNewTask()));

      expect(find.byType(CreateNewTask), findsOneWidget);
      expect(find.text("Create New Task"), findsOneWidget);

      expect(find.byType(ClipRRect), findsOneWidget);
      expect(find.byType(GestureDetector), findsWidgets);
      expect(find.byType(ElevatedButton), findsOneWidget);

      await tester.tap(find.text("Add Task"));
      await tester.pumpAndSettle();
    });

    testWidgets("Test TextFormField", (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MaterialApp(
            home: CreateNewTask(),
          ),
        ),
      );
      await tester.enterText(find.byKey(const Key('taskName')), "Task1");
      await tester.pump();
      expect(find.text("Task1"), findsOneWidget);
    });    

    testWidgets('CreateNewTask pickDate Test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CreateNewTask()));

      await tester.tap(find.byIcon(Icons.date_range_outlined));
      await tester.pumpAndSettle();

      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
    });
  });
}
