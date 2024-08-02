import 'package:vibe/app/authentication/data/auth_service.dart';
import 'package:vibe/app/authentication/data/firebase_auth_service.dart';

import 'state/auth_state.dart';

class AuthController {
  final AuthService service = FirebaseAuthService();
  Future<AuthState> sendOtp(String phoneNumber) async {
    final result = await service.sendOtp(phoneNumber);
    return result;
  }

  Future<AuthState> verifyOtp({required String otp, required String inputCode}) async {
    final result = await service.verifyOtp(otp, inputCode);
    return result;
  }
}
