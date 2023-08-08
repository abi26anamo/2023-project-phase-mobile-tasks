
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/onboarding.dart';

import 'package:layout_task/main.dart';
import 'package:layout_task/todo_list.dart';



void main() {
  testWidgets('navigation To-Do list page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp()); 

    expect(find.byType(MyHomePage), findsOneWidget);

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle(); 

    expect(find.byType(TodoListPage), findsOneWidget); 
    expect(find.text('Todo List'), findsOneWidget); 
  });
}
