import 'package:flutter/material.dart';
import 'package:vibe/app/_commons/extensions.dart';

import '../../_commons/vibe_ui/palette/vui_palette.dart';
import '../../_commons/vibe_ui/typography/vui_text.dart';
import '../../_commons/vibe_ui/vui_buttons.dart';
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
                    VIBETextformfield(
                      hintText: "Full name",
                      onChanged: (v) {},
                    ),
                    const SizedBox(height: 10),
                    VIBETextformfield(
                      hintText: "Email",
                      onChanged: (v) {},
                    ),
                    const SizedBox(height: 10),
                    VIBETextformfield(
                      hintText: "Password",
                      onChanged: (v) {},
                    ),
                    const Spacer(),
                    VUIButtons.solid(
                      label: "Continue",
                      onPressed: () {},
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
