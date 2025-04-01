import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:study_mate/Core/Theme/app_colors.dart';
import 'package:study_mate/Core/Theme/app_text_styles.dart';
import 'package:study_mate/Core/helpers/spacing.dart';
import 'package:study_mate/Core/routes/routes.dart';
import 'package:study_mate/Core/widgets/custom_text_button.dart';
import 'package:study_mate/Core/widgets/text_with_action.dart';

class VerifyOtpBody extends StatefulWidget {
  const VerifyOtpBody({super.key});

  @override
  State<VerifyOtpBody> createState() => _VerifyOtpBodyState();
}

class _VerifyOtpBodyState extends State<VerifyOtpBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(80),
        Text("Verify Code", style: AppTextStyles.quicksand24Bold(fontSize: 30)),
        verticalSpace(16),
        Text(
          "Please enter the code we just sent to your email",
          textAlign: TextAlign.center,
          style: AppTextStyles.poppins14Regular(
            color: AppColors.grey,
            fontSize: 18,
          ),
        ),
        verticalSpace(60),
        PinCodeTextField(
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
          onChanged: (value) {
            // Handle the change in OTP input here
            print("OTP changed: $value");
          },
          onCompleted: (value) {
            // Handle the completed OTP input here
            print("OTP entered: $value");
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the OTP';
            }
            return null;
          },
        ),

        verticalSpace(50),
        CustomTextButton(
          buttonText: "Verify",
          textStyle: AppTextStyles.poppins14Regular(
            color: AppColors.white,
            fontSize: 16,
          ),
          borderRadius: 8,
          horizontalPadding: 16,
          verticalPadding: 10,
          onPressed: () {
            Navigator.pushNamed(context, Routes.resetPassword);
          },
          backgroundColor: AppColors.primary,
        ),
        verticalSpace(20),
        Align(
          alignment: Alignment.center,
          child: TextWithAction(
            text: "Didn’t receive code? ",
            actionText: "Re-send code",
            onTap: () {
              //call resend code function here
              // Handle resend code action here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Code resent successfully.')),
              );
            },
          ),
        ),
      ],
    );
  }
}
