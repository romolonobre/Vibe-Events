// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:vibe/app/_commons/extensions.dart';
import 'package:vibe/app/_commons/vibe_ui/palette/vui_palette.dart';
import 'package:vibe/app/_commons/vibe_ui/typography/vui_text.dart';
import 'package:vibe/app/_commons/vibe_ui/vui_buttons.dart';
import 'package:vibe/app/authentication/interactor/state/auth_state.dart';

import '../../_commons/vibe_ui/vui_snackbar.dart';
import '../../_commons/widgets/app_logo.dart';
import '../interactor/auth_controller.dart';
import 'widgtes/pin_input_theme.dart';

class AuthDto {
  String otp;
  String phoneNumber;
  AuthDto({
    required this.otp,
    required this.phoneNumber,
  });
}

class VerifyOTPScreen extends StatefulWidget {
  final AuthDto authDto;
  const VerifyOTPScreen({super.key, required this.authDto});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final controller = AuthController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    log(widget.authDto.otp);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: [
              const SizedBox(height: 80),
              //
              // APP Logo
              AppLogo(
                logoColor: VUIPalette.primaryColor,
                sloganColor: VUIPalette.primaryColor,
                logoSize: 23,
                sloganSize: 10,
              ),
              const Spacer(),
              VUIText.content(
                "Verify phone",
                fontWeight: FontWeight.w500,
                fontsize: 18,
              ),
              const SizedBox(height: 5),
              VUIText.content(
                "Code has been sent to ${widget.authDto.phoneNumber}",
                fontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 30),

              // Verification code input
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinInputTheme,
                errorPinTheme: errorPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                onCompleted: (inputCode) async {
                  final state = await controller.verifyOtp(otp: widget.authDto.otp, inputCode: inputCode);
                  if (state is VerifyOTPErrorState) {
                    VUISnackbar.show(
                      context,
                      message: state.errorMessage,
                      isError: true,
                    );
                    return;
                  }
                  if (state is VerifyOTPSuccessState) {
                    context.push('/home');
                    return;
                  }
                },
              ),
              const SizedBox(height: 20),

              VUIText.content(
                "Didn't get the OTP Code?",
                fontWeight: FontWeight.w300,
              ),

              // Resend code button
              VUIButtons.text(
                label: 'Resend code',
                onPressed: () async => onOtpResend(),
              ),
              const SizedBox(height: 40),
              const Spacer(),
            ],
          ).paddingOnly(left: 20, right: 20),
        ),
      ),
    );
  }

  onOtpResend() async {
    setState(() => isLoading = true);
    final state = await controller.sendOtp(widget.authDto.phoneNumber);

    if (state is SendOTPSuccessState) {
      VUISnackbar.show(context, message: "OTP sent to  ${widget.authDto.phoneNumber}");
      setState(() => isLoading = false);
      return;
    }
    if (state is SendOTPErrorState) {
      VUISnackbar.show(context, message: state.errorMessage);
      setState(() => isLoading = false);
    }
  }
}
