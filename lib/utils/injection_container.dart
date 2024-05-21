
import 'package:flutter_bloc_clean_architecture_example/domain/usecases/get_all_tasks_usecase.dart';
import 'package:flutter_bloc_clean_architecture_example/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

import '../data/repositories/tasks_repository.dart';
import '../data/repositories/users_repository.dart';
import '../domain/usecases/add_task_usecase.dart';
import '../domain/usecases/delete_task_usecase.dart';
import '../domain/usecases/get_my_tasks_usecase.dart';
import '../domain/usecases/login_usecase.dart';
import '../domain/usecases/update_task_usecase.dart';
import '../presentation/bloc/task_bloc/task_bloc.dart';

final sl = GetIt.instance;

void initInjection(){

  /// Bloc
  sl.registerLazySingleton(() => AuthBloc());
  sl.registerLazySingleton(() => TaskBloc());

  /// UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetAllTasksUseCase(sl()));
  sl.registerLazySingleton(() => GetMyTasksUseCase(sl()));
  sl.registerLazySingleton(() => AddTasksUseCase(sl()));
  sl.registerLazySingleton(() => UpdateTasksUseCase(sl()));
  sl.registerLazySingleton(() => DeleteTasksUseCase(sl()));

  /// Repos
  sl.registerLazySingleton(() => UsersRepositoryImp());
  sl.registerLazySingleton(() => TasksRepositoryImp());

}