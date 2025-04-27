import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/helpers/show_custom_dialog.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Features/Auth/login/domain/login-cubit/login_cubit.dart';
import 'package:study_mate/Features/Auth/login/presentation/widgets/login_form.dart';
import 'package:study_mate/Features/Auth/login/presentation/widgets/login_header.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        } else if (state is LoginInitial) {
          Navigator.pop(context);
        } else if (state is LoginSuccess) {
          showCustomDialog(
            context,
            title: "Success",
            message: "Welcome back to StudyMate \n  Your ideal Study Partner",
            isSuccess: true,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.nav_bar, 
                arguments: {
                  'token': state.response.token,
                },

                (route) => false,
              );
            },
          );
        } else if (state is LoginFailure) {
          showCustomDialog(
            context,
            title: "Error",
            message: state.error,
            isSuccess: false,
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }
      },
      builder: (context, state) {
        return const SingleChildScrollView(
          child: Column(
            children: [
              LoginHeader(),
              LoginForm(),
            ],
          ),
        );
      },
    );
  }
}