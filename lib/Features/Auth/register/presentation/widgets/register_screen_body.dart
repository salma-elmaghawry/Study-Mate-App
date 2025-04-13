import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/helpers/show_custom_dialog.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Features/Auth/register/domain/register-cubit/register_cubit.dart';
import 'package:study_mate/Features/Auth/register/presentation/widgets/register_form.dart';
import 'package:study_mate/Features/Auth/register/presentation/widgets/register_header.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        } else if (state is RegisterSuccess) {
          showCustomDialog(
            context,
            title: "Success",
            message: "Account created successfully,Let's verify your email",
            isSuccess: true,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.verifyOtp,
                (route) => false,
                arguments: state.email,
              );
            },
          );
        } else if (state is RegisterFailure) {
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
              RegisterHeader(),
              RegisterForm(),
            ],
          ),
        );
      },
    );
  }
}