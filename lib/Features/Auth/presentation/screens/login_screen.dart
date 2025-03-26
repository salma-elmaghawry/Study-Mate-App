import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/networking/api_service.dart';
import 'package:study_mate/Features/Auth/data/auth_repo.dart';
import 'package:study_mate/Features/Auth/presentation/cubits/login/login_cubit.dart';
import 'package:study_mate/Features/Auth/presentation/widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    final AuthRepository authRepository = AuthRepository(ApiService(Dio()));
    return BlocProvider(
      create: (context) => LoginCubit(authRepository),
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(child: LoginScreenBody()),
          ),
        ),
      ),
    );
  }
}
