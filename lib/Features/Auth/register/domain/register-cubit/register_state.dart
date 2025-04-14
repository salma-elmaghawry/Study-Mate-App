part of 'register_cubit.dart';

// Removed import as part-of directive must be the only directive

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
    final String email;

  final RegisterResponse response;

  RegisterSuccess(this.response,this.email);

  @override
  List<Object?> get props => [response];
}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure(this.error);

  @override
  List<Object?> get props => [error];
}
