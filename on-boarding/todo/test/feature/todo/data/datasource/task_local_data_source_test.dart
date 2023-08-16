import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/core/errors/exception.dart';
import 'package:layout_task/features/todo/data/datasources/task_local_data_source.dart';
import 'package:layout_task/features/todo/data/models/todo_model.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixtures/fixure_reader.dart';
import '../../helpers/mock_shared_preference.mocks.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late TaskLocalDataSourceImpl datasource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    datasource =
        TaskLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group("get  task", () {
    final todoModel =  TodoModel.fromJson(json.decode(fixture("todo_cached.json")));

    test(
        " should return task from sharedpreferences when there is one in cache",
        () async {
      when(mockSharedPreferences.getString(CACHED_TASK))
          .thenReturn(fixture("todo_cached.json"));

      final result = await datasource.getTask();

      verify(mockSharedPreferences.getString(CACHED_TASK));
      expect(result, equals(todoModel));
    });

    test("should return cacheException when there is no cached task", () {
      when(mockSharedPreferences.getString(CACHED_TASK)).thenReturn(null);
      final call = datasource.getTask;

      expect(() => call(), throwsA(TypeMatcher<CacheException>));
    });
  });

  group("cachetask", () {
    final todoModel = TodoModel(
      id: "1",
      text: "text",
      title: "title",
      subtitle: "subtitle",
      date: "12/423",
    );

    test("should call sharedprefereces to cache task", () {
      datasource.cacheTask(todoModel);

      final expectedJsonString = json.encode(todoModel.toJson());

      verify(mockSharedPreferences.setString(CACHED_TASK, expectedJsonString));
    });
  });
}
