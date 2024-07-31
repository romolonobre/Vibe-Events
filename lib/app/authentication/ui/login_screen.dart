import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vibe/app/_commons/extensions.dart';
import 'package:vibe/app/_commons/vibe_ui/typography/vui_text.dart';
import 'package:vibe/app/_commons/widgets/vibe_textformfield.dart';

import '../../_commons/vibe_ui/palette/vui_palette.dart';
import '../../_commons/vibe_ui/vui_buttons.dart';
import 'widgtes/platform_login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: VUIPalette.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 90),
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height - 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VUIText.content(
                      "Hello,",
                      fontWeight: FontWeight.w600,
                    ),
                    VUIText.subTitle(
                      "Sign in!",
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 40),

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
                    const SizedBox(height: 10),

                    //
                    // Sign up button
                    Row(
                      children: [
                        VUIText.content(
                          "Don't have an account?",
                          fontsize: 14,
                          fontWeight: FontWeight.w600,
                        ).paddingOnly(left: 5),
                        GestureDetector(
                          child: VUIText.content(
                            "Sign up",
                            fontsize: 14,
                            color: VUIPalette.primaryColor,
                            fontWeight: FontWeight.w600,
                          ).paddingOnly(left: 5),
                          onTap: () => context.pushNamed("/register"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    //
                    // Goolgle Sign in button
                    Align(
                      alignment: Alignment.center,
                      child: PlatformLoginButton(
                        "assets/images/gmail.png",
                        ontap: () {},
                      ),
                    ),
                    const Spacer(),
                    //
                    // Sign in button
                    VUIButtons.solid(
                      label: "Sign in!",
                      onPressed: () => context.goNamed('/home'),
                    ).paddingOnly(bottom: 20)
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
