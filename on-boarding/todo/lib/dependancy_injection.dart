import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:layout_task/core/network/network_info.dart';
import 'package:layout_task/features/todo/data/datasources/task_remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/todo/data/datasources/task_local_data_source.dart';
import 'features/todo/data/repository/task_repository_impl.dart';
import 'features/todo/domain/repository/task_repository.dart';
import 'features/todo/domain/usecases/create_task_usecase.dart';
import 'features/todo/domain/usecases/delete_task_usecase.dart';
import 'features/todo/domain/usecases/update_task_usecase.dart';
import 'features/todo/domain/usecases/view_all_task_usecase.dart';
import 'features/todo/domain/usecases/view_single_task.dart';
import 'features/todo/presentation/bloc/todo_bloc.dart';

final sl = GetIt.instance;

void init() async {
  // Bloc
  sl.registerFactory(
    () => TodoBloc(
      createTodoTask: sl(),
      viewAllTasks: sl(),
      updateTodoTask: sl(),
      deleteTodoTask: sl(),
      viewTask: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => CreateTodoTask(sl()));
  sl.registerLazySingleton(() => ViewAllTasks(sl()));
  sl.registerLazySingleton(() => UpdateTodoTask(sl()));
  sl.registerLazySingleton(() => DeleteTodoTask(sl()));
  sl.registerLazySingleton(() => ViewTask(sl()));

  // Repository

  sl.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(
      localDataSource: sl(),
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<TaskLocalDataSource>(
    () => TaskLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<TaskRemoteDataSource>(
    () => TaskRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      connectivity: sl(),
    ),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => Connectivity());
}
