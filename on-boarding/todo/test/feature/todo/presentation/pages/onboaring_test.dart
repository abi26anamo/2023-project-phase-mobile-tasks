import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/features/todo/presentation/pages/onboarding_page.dart';
import 'package:layout_task/features/todo/presentation/pages/task_list_page.dart';
import 'package:layout_task/main.dart';




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
