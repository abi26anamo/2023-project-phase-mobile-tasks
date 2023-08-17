import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:layout_task/features/todo/data/datasources/task_remote_data_source.dart';
import 'package:layout_task/features/todo/data/models/todo_model.dart';
import 'package:mockito/mockito.dart';
import '../../../../fixtures/fixure_reader.dart';
import '../../helpers/mock_remote_data_source.mocks.dart';

void main() {
  late MockClient client;
  late TaskRemoteDataSourceImpl dataSourceImpl;

  setUp(() {
    client = MockClient();
    dataSourceImpl = TaskRemoteDataSourceImpl(client: client);
  });

  group('getTask', () {
    final tTaskModel = TodoModel.fromJson(json.decode(fixture('todo.json')));
    final tId = 1;

    test('should return TaskModel when the response code is 200', () async {
      when(client.get(
              Uri.parse("https://jsonplaceholder.typicode.com/todos/$tId")))
          .thenAnswer((_) async => http.Response(fixture('todo.json'), 200));

      final result = await dataSourceImpl.getTask(tId);
      expect(result, equals(tTaskModel));
    });
  });
}
