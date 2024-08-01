import 'package:flutter/material.dart';
import 'package:vibe/app/_commons/extensions.dart';

import '../../_commons/vibe_ui/palette/vui_palette.dart';
import '../../_commons/vibe_ui/typography/vui_text.dart';
import '../../_commons/vibe_ui/vui_buttons.dart';
import '../../_commons/widgets/app_logo.dart';
import '../../_commons/widgets/vibe_textformfield.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: VUIPalette.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppLogo(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VUIText.subTitle(
                      "Sign up!",
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 30),

                    // Full name input
                    VIBETextformfield(
                      hintText: "Full name",
                      onChanged: (v) {},
                    ),
                    const SizedBox(height: 10),

                    // Email input
                    VIBETextformfield(
                      hintText: "Email",
                      onChanged: (v) {},
                    ),
                    const SizedBox(height: 10),

                    // Password input
                    VIBETextformfield(
                      hintText: "Password",
                      onChanged: (v) {},
                    ),
                    const Spacer(),

                    // Sign up button
                    VUIButtons.solid(
                      label: "Sign up!",
                      onPressed: () {},
                    ).paddingOnly(bottom: 30)
                  ],
                ).paddingOnly(left: 20, right: 20, top: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
