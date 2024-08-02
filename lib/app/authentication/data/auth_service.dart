import 'package:vibe/app/authentication/interactor/state/auth_state.dart';

abstract class AuthService {
  Future<AuthState> sendOtp(String phoneNumber);
  Future<AuthState> verifyOtp(String otpcode, String sms);
}
