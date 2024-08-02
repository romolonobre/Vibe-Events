import 'package:firebase_auth/firebase_auth.dart';
import 'package:vibe/app/authentication/data/auth_service.dart';

import '../interactor/state/auth_state.dart';

class FirebaseAuthService implements AuthService {
  @override
  Future<AuthState> sendOtp(String phoneNumber) async {
    String otp = '';
    String errorMessage = '';

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (_) => {},
        verificationFailed: (error) => errorMessage = error.code,
        codeSent: (verificationId, _) => otp = verificationId,
        codeAutoRetrievalTimeout: (_) => {},
      );

      if (errorMessage.isNotEmpty) {
        return SendOTPErrorState(errorMessage: errorMessage);
      }

      return SendOTPSuccessState(otp: otp);
    } catch (e) {
      return SendOTPErrorState(errorMessage: e.toString());
    }
  }

  @override
  Future<AuthState> verifyOtp(String otp, String inputCode) async {
    try {
      final cred = PhoneAuthProvider.credential(verificationId: otp, smsCode: inputCode);
      await FirebaseAuth.instance.signInWithCredential(cred);
      return VerifyOTPSuccessState();
    } catch (e) {
      return VerifyOTPErrorState(errorMessage: e.toString());
    }
  }
}
