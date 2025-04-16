import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:study_mate/Core/networking/api_service.dart';
import 'package:study_mate/Features/Auth/forget_password/data/forgot_password_repo.dart';
import 'package:study_mate/Features/Auth/forget_password/domain/cubit/forget_password_cubit.dart';
import 'package:study_mate/Features/Auth/login/data/login_repo.dart';
import 'package:study_mate/Features/Auth/login/domain/login-cubit/login_cubit.dart';
import 'package:study_mate/Features/Auth/register/data/register_repo.dart';
import 'package:study_mate/Features/Auth/register/domain/register-cubit/register_cubit.dart';
import 'package:study_mate/Features/Auth/verity_otp/data/verify_otp_repo.dart';
import 'package:study_mate/Features/Auth/verity_otp/domain/cubit/verify_otp_cubit.dart';
import 'package:study_mate/Features/Summarization/data/Summarization_repo.dart';
import 'package:study_mate/Features/Summarization/domain/cubit/summarization_cubit.dart';


final getIt=GetIt.instance;
Future<void> setupGetIt() async {
//dio and api service
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => ApiService(getIt<Dio>()));

  //login cuit
  getIt.registerLazySingleton(() => loginRepository(getIt<ApiService>()));
  getIt.registerFactory(() => LoginCubit(getIt<loginRepository>()));
  //register cubit
  getIt.registerLazySingleton(() => RegisterRepo(getIt<ApiService>()));
  getIt.registerFactory(() => RegisterCubit(getIt<RegisterRepo>()));
//veriify otp cuubit
  getIt.registerLazySingleton(() => VerifyEmailRepo(getIt<ApiService>()));
  getIt.registerFactory(() => VerifyOtpCubit(getIt<VerifyEmailRepo>()));

  //forgot password repo
  getIt.registerLazySingleton(() => ForgotPasswordRepo(getIt<ApiService>()));
  getIt.registerFactory(() => ForgotPasswordCubit(getIt<ForgotPasswordRepo>()));

  //summarization repo
   getIt.registerLazySingleton(() => SummarizeRepo(getIt<ApiService>(), getIt<Dio>()));
  getIt.registerFactory(() => SummarizeCubit(getIt<SummarizeRepo>()));
}