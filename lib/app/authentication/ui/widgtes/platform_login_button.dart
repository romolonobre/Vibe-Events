import 'package:flutter/material.dart';
import 'package:vibe/app/_commons/extensions.dart';

import '../../../_commons/vibe_ui/typography/vui_text.dart';

class PlatformLoginButton extends StatelessWidget {
  final String icon;
  final Function ontap;
  const PlatformLoginButton(this.icon, {required this.ontap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap(),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.6,
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
            ).paddingAll(20),
            VUIText.content(
              "Sign in with Google",
              fontsize: 12,
            )
          ],
        ),
      ),
    );
  }
}
