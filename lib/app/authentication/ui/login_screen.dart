// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vibe/app/_commons/extensions.dart';

import '../../_commons/vibe_ui/palette/vui_palette.dart';
import '../../_commons/vibe_ui/typography/vui_text.dart';
import '../../_commons/widgets/app_logo.dart';
import 'widgtes/login_with_phone_number_section.dart';
import 'widgtes/platform_login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Center(
            // APP Logo
            child: AppLogo(
              logoColor: VUIPalette.primaryColor,
              sloganColor: VUIPalette.primaryColor,
              logoSize: 23,
              sloganSize: 10,
            ),
          ),
          const SizedBox(height: 40),

          // Welcome text
          VUIText.subTitle(
            "Hi! Welcome to Vibe",
            color: VUIPalette.black,
            fontWeight: FontWeight.w600,
            fontsize: 17,
          ),
          const SizedBox(height: 5),
          VUIText.content(
            "Please select a sign-in method: Phone Number or Google.",
            color: VUIPalette.black,
            fontWeight: FontWeight.w300,
            fontsize: 14,
          ),
          const SizedBox(height: 60),

          // Phone Number section
          const LoginWithPhoneNumberSection(),

          const SizedBox(height: 80),

          // Divider
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: Divider(
                  color: VUIPalette.black.withOpacity(0.1),
                  height: 1,
                ),
              ),
              VUIText.content(
                "Or",
                color: VUIPalette.black,
                fontsize: 13,
              ),
              SizedBox(
                width: 150,
                child: Divider(
                  color: VUIPalette.black.withOpacity(0.1),
                  height: 1,
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          // Goolgle Sign in button
          Align(
            alignment: Alignment.center,
            child: PlatformLoginButton(
              "assets/images/google.png",
              ontap: () {},
            ),
          ),
          const Spacer(),
        ],
      ).paddingOnly(left: 20, right: 20),
    );
  }
}
