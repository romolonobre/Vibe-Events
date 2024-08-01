// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../vibe_ui/typography/vui_text.dart';

class AppLogo extends StatelessWidget {
  Color logoColor;
  Color sloganColor;
  double logoSize;
  double sloganSize;
  AppLogo({
    super.key,
    this.logoColor = Colors.white,
    this.sloganColor = Colors.white,
    this.logoSize = 60,
    this.sloganSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Vibe",
          style: TextStyle(
            color: logoColor,
            fontSize: logoSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        VUIText.content(
          "Connect, Discover, Enjoy",
          fontsize: sloganSize,
          color: sloganColor,
        ),
      ],
    );
  }
}
