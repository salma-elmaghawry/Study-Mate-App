import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Core/widgets/custom_text_button.dart';
import 'package:study_mate/Core/widgets/text_with_action.dart';
import 'package:study_mate/Features/Auth/verity_otp/domain/cubit/verify_otp_cubit.dart';

class VerifyOtpBody extends StatefulWidget {
  final String email;

  const VerifyOtpBody({super.key, required this.email});

  @override
  State<VerifyOtpBody> createState() => _VerifyOtpBodyState();
}

class _VerifyOtpBodyState extends State<VerifyOtpBody> {
  final otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          verticalSpace(80),
          Text("Verify Code", style: AppTextStyles.quicksand24Bold(fontSize: 30)),
          verticalSpace(16),
          Text(
            "Please enter the code we just sent to ${widget.email}",
            textAlign: TextAlign.center,
            style: AppTextStyles.poppins14Regular(
              color: AppColors.grey,
              fontSize: 18,
            ),
          ),
          verticalSpace(60),
          PinCodeTextField(
            controller: otpController,
            appContext: context,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            keyboardType: TextInputType.number,
            cursorColor: AppColors.primary,
            textStyle: const TextStyle(fontSize: 20),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              activeColor: AppColors.primary,
              fieldWidth: 40,
              activeFillColor: Colors.white,
              inactiveFillColor: Colors.grey.shade200,
              selectedFillColor: Colors.white,
              selectedColor: AppColors.primary,
            ),
            validator: (value) {
              if (value?.length != 6) return 'Enter complete 6-digit code';
              return null;
            },
            onCompleted: (value) => _verifyOtp(context),
          ),
          verticalSpace(50),
          BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
            builder: (context, state) {
              if (state is VerifyOtpLoading) {
                return const CircularProgressIndicator(color: AppColors.primary);
              }
              return CustomTextButton(
                buttonText: "Verify",
                textStyle: AppTextStyles.poppins14Regular(
                  color: AppColors.white,
                  fontSize: 16,
                ),
                borderRadius: 8,
                horizontalPadding: 16,
                verticalPadding: 10,
                onPressed: () => _verifyOtp(context),
                backgroundColor: AppColors.primary,
              );
            },
          ),
          verticalSpace(20),
          BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
            builder: (context, state) {
              if (state is ResendOtpLoading) {
                return const CircularProgressIndicator(color: AppColors.primary);
              }
              return Align(
                alignment: Alignment.center,
                child: TextWithAction(
                  text: "Didn't receive code? ",
                  actionText: "Re-send code",
                  onTap: () {
                    context.read<VerifyOtpCubit>().resendOtp(widget.email);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Code resent successfully')),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _verifyOtp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<VerifyOtpCubit>().verifyOtp(
            email: widget.email,
            code: otpController.text,
          );
    }
  }
}