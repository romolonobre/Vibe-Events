abstract class AuthState {}

class SendOTPSuccessState extends AuthState {
  final String otp;

  SendOTPSuccessState({required this.otp});
}

class SendOTPErrorState extends AuthState {
  final String errorMessage;

  SendOTPErrorState({required this.errorMessage});
}

class VerifyOTPSuccessState extends AuthState {}

class VerifyOTPErrorState extends AuthState {
  final String errorMessage;

  VerifyOTPErrorState({required this.errorMessage});
}
