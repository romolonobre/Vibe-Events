import 'package:flutter/material.dart';

import '../../../_commons/vibe_ui/typography/vui_text.dart';

class InfoRowWidget extends StatelessWidget {
  final String firstInfo;
  final String secondInfo;
  final IconData icon1;
  final IconData icon2;
  final double iconSize;
  final double fontsize;
  final MainAxisAlignment mainAxisAlignment;
  final double? space;

  const InfoRowWidget({
    super.key,
    required this.firstInfo,
    required this.secondInfo,
    required this.icon1,
    required this.icon2,
    this.fontsize = 10,
    this.iconSize = 18,
    this.space,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Row(
          children: [
            //
            // First element
            Icon(
              icon1,
              color: Colors.grey.shade400,
              size: iconSize,
            ),
            const SizedBox(width: 3),
            VUIText.content(
              firstInfo,
              fontsize: fontsize,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        if (space != null) SizedBox(width: space),

        //
        // Second element
        Row(
          children: [
            Icon(
              icon2,
              color: Colors.grey.shade400,
              size: iconSize,
            ),
            const SizedBox(width: 3),
            VUIText.content(
              secondInfo,
              fontsize: fontsize,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w400,
            ),
          ],
        )
      ],
    );
  }
}
