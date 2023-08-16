import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/core/network/network_info.dart';
import 'package:mockito/mockito.dart';
import '../../feature/todo/helpers/mock_data_connection_checker.mocks.dart';

void main() {
  late NetworkInfoImpl networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(connectionChecker: mockDataConnectionChecker);
  });

  group("is connected", () {
    test("should forward the call to DataConnectionChecker.hasConnection",
        () async {
      final tHasConnectionFuture = Future.value(true);
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);
      final result = networkInfo.isConnected;

      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
