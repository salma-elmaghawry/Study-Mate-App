part of 'verify_otp_cubit.dart';

abstract class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {}

class VerifyOtpFailure extends VerifyOtpState {
  final String error;
  VerifyOtpFailure({required this.error});
}

class ResendOtpLoading extends VerifyOtpState {}

class ResendOtpSuccess extends VerifyOtpState {}

class ResendOtpFailure extends VerifyOtpState {
  final String error;
  ResendOtpFailure({required this.error});
}