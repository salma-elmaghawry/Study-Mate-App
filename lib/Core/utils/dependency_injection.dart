// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import '../../Features/Auth/Data/Datasources/auth_remote_datasource.dart';
// import '../../Features/Auth/Data/Repositories/auth_repository_impl.dart';
// import '../../Features/Auth/Domain/Repositories/auth_repository.dart';
// import '../../Features/Auth/Domain/Usecases/login_usecase.dart';
// import '../Network/api_service.dart';

// final sl = GetIt.instance;

// void init() {
//   // Core
//   sl.registerLazySingleton(() => Dio());
//   sl.registerLazySingleton(() => ApiService(sl()));

//   // Data Sources
//   sl.registerLazySingleton<AuthRemoteDataSource>(
//       () => AuthRemoteDataSourceImpl(sl()));

//   // Repositories
//   sl.registerLazySingleton<AuthRepository>(
//       () => AuthRepositoryImpl(sl()));

//   // Use Cases
//   sl.registerLazySingleton(() => LoginUseCase(sl()));
// }