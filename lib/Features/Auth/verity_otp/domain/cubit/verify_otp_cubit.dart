import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_mate/Features/Auth/verity_otp/data/verify_otp_model.dart';
import 'package:study_mate/Features/Auth/verity_otp/data/verify_otp_repo.dart';

part 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final VerifyEmailRepo verifyEmailRepo;

  VerifyOtpCubit(this.verifyEmailRepo) : super(VerifyOtpInitial());

  Future<void> verifyOtp({required String email, required String code}) async {
    emit(VerifyOtpLoading());
    try {
      final request = VerifyEmailRequestModel(
        email: email,
        code: int.tryParse(code) ?? 0,
      );
      
      await verifyEmailRepo.verifyEmail(request);
      emit(VerifyOtpSuccess());
    } catch (e) {
      emit(VerifyOtpFailure(error: e.toString()));
    }
  }

  Future<void> resendOtp(String email) async {
    emit(ResendOtpLoading());
    try {
      await verifyEmailRepo.resendOtp(email);
      emit(ResendOtpSuccess());
    } catch (e) {
      emit(ResendOtpFailure(error: e.toString()));
    }
  }
}