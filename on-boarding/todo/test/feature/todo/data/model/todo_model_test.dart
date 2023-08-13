import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/features/todo/data/models/todo_model.dart';

import '../../../../fixture/fixure_reader.dart';

void main() {
  setUp(() {
    final tTodoModel = TodoModel(
      id: "1",
      text: "test text",
      title: "test",
      subtitle: "ui design",
      date: "12/7/2023",
    );

    test("should be a subclass of TodoModel entity", () {
      expect(tTodoModel, isA<TodoModel>());
    });

    group("fromJson", () {
      test("should return a valid todo model ", () {
        final Map<String, dynamic> jsonMap = json.decode(fixture("todo.json"));

        final result = TodoModel.fromJson(jsonMap);

        expect(result, tTodoModel);
      });
    });

    group("toJson", () {
      test("should return a JSON map containing the proper data", () async {
        final result = tTodoModel.toJson();

        final expectedJsonMap = {
          "id": "1",
          "text": "test text",
          "title": "test",
          "subtitle": "ui design",
          "date": "12/7/2023",
        };

        expect(result, expectedJsonMap);
      });
    });
  });
}
