import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:study_mate/Core/networking/api_service.dart';
import 'package:study_mate/Features/Auth/data/auth_repo.dart';
import 'package:study_mate/Features/Auth/presentation/cubits/login/login_cubit.dart';
import 'package:study_mate/Features/Auth/presentation/cubits/register/register_cubit.dart';

final getIt=GetIt.instance;
Future<void> setupGetIt() async {
//dio and api service
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => ApiService(getIt<Dio>()));

//Auth Repository
  getIt.registerLazySingleton(() => AuthRepository(getIt<ApiService>()));
  //login cuit
  getIt.registerFactory(() => LoginCubit(getIt<AuthRepository>()));
  //register cubit
  getIt.registerFactory(() => RegisterCubit(getIt<AuthRepository>()));
}