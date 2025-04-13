part of 'forget_password_cubit.dart';

abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {}

class ForgotPasswordFailure extends ForgotPasswordState {
  final String error;
  ForgotPasswordFailure(this.error);
}

class VerifyResetCodeLoading extends ForgotPasswordState {}

class VerifyResetCodeSuccess extends ForgotPasswordState {
  final String code;

  VerifyResetCodeSuccess(this.code);
}

class VerifyResetCodeFailure extends ForgotPasswordState {
  final String error;
  VerifyResetCodeFailure(this.error);
}

class ResetPasswordLoading extends ForgotPasswordState {}

class ResetPasswordSuccess extends ForgotPasswordState {}

class ResetPasswordFailure extends ForgotPasswordState {
  final String error;
  ResetPasswordFailure(this.error);
}
