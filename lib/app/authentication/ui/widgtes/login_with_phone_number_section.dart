import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe/app/_commons/extensions.dart';
import 'package:vibe/app/_commons/vibe_ui/vui_buttons.dart';
import 'package:vibe/app/authentication/interactor/auth_controller.dart';
import 'package:vibe/app/authentication/ui/verify_otp_screen.dart';

import '../../../_commons/vibe_ui/palette/vui_palette.dart';
import '../../../_commons/vibe_ui/typography/vui_text.dart';
import '../../../_commons/vibe_ui/vui_snackbar.dart';
import '../../../_commons/widgets/vibe_textformfield.dart';
import '../../interactor/country_code.dart';
import '../../interactor/state/auth_state.dart';

class LoginWithPhoneNumberSection extends StatefulWidget {
  const LoginWithPhoneNumberSection({super.key});

  @override
  State<LoginWithPhoneNumberSection> createState() => _LoginWithPhoneNumberSectionState();
}

class _LoginWithPhoneNumberSectionState extends State<LoginWithPhoneNumberSection> {
  late CountyCode selectedCountry;
  String phoneNumber = '';

  final controller = AuthController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    selectedCountry = countryCodes.first;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VUIText.content(
          "Enter your phone number",
          color: VUIPalette.black,
          fontWeight: FontWeight.w300,
          fontsize: 12,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            //
            // Country code picker
            Hero(
              tag: "flag",
              child: InkWell(
                onTap: () => _showCountryCodePicker(),
                child: Container(
                  height: 60,
                  width: 75,
                  color: const Color(0xfff1f2f4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        selectedCountry.flag,
                        width: 22,
                        height: 18,
                      ).borderRadius(3),
                      Icon(Icons.keyboard_arrow_down_outlined, color: VUIPalette.black.withOpacity(0.5))
                    ],
                  ).paddingOnly(),
                ).borderRadius(15),
              ),
            ),
            const SizedBox(width: 5),

            // Phone number input
            Expanded(
              child: VIBETextformfield(
                hintText: 'Phone number',
                onChanged: (value) {
                  phoneNumber = value;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        VUIText.content(
          "We will send a verification code to on your number to confim it's you.",
          color: VUIPalette.black,
          fontWeight: FontWeight.w300,
          fontsize: 12,
        ).paddingOnly(left: 5),
        const SizedBox(height: 30),

        // Send verification code button
        VUIButtons.solid(
          label: isLoading ? "Processing..." : "Send Verification code",
          height: 55,
          onPressed: phoneNumber.isEmpty
              ? null
              : () async {
                  setState(() => isLoading = true);
                  final state = await controller.sendOtp("${selectedCountry.code}$phoneNumber");

                  if (state is SendOTPSuccessState) {
                    log(state.otp);
                    context.push(
                      '/register',
                      extra: AuthDto(
                        otp: state.otp,
                        phoneNumber: "${selectedCountry.code}$phoneNumber",
                      ),
                    );
                    setState(() => isLoading = false);
                    return;
                  }
                  if (state is SendOTPErrorState) {
                    VUISnackbar.show(
                      context,
                      message: state.errorMessage,
                      isError: true,
                    );
                    setState(() => isLoading = false);
                  }
                },
        )
      ],
    );
  }

  onSendOtp() async {
    setState(() => isLoading = true);
    final state = await controller.sendOtp("${selectedCountry.code}$phoneNumber");

    if (state is SendOTPSuccessState) {
      log(state.otp);
      context.push('/register', extra: AuthDto(otp: state.otp, phoneNumber: "${selectedCountry.code}$phoneNumber"));
      setState(() => isLoading = false);
      return;
    }
    if (state is SendOTPErrorState) {
      VUISnackbar.show(
        context,
        message: state.errorMessage,
        isError: true,
      );
      setState(() => isLoading = false);
    }
  }

  void _showCountryCodePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ...countryCodes.map(
              (country) {
                return ListTile(
                  leading: SvgPicture.asset(
                    country.flag,
                    width: 22,
                    height: 20,
                  ).borderRadius(3),
                  title: VUIText.content(
                    "(${country.code})  ${country.name} ",
                    color: VUIPalette.black,
                    fontsize: 14,
                  ),
                  onTap: () {
                    selectedCountry = country;
                    setState(() {});
                    Navigator.pop(context);
                  },
                );
              },
            )
          ],
        ).paddingOnly(top: 20, bottom: 40, left: 10);
      },
    );
  }
}
