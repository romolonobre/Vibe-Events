import 'package:flutter/material.dart';

import 'palette/vui_palette.dart';
import 'typography/vui_text.dart';

class VUIButtons {
  static Widget solid({
    required String label,
    required Function? onPressed,
    Color? backgroundColor,
    Color? textColor,
    double? width,
    double? height,
  }) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: onPressed != null ? backgroundColor ?? VUIPalette.primaryColor : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: () => onPressed != null ? onPressed() : null,
        child: VUIText.content(
          label,
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  static Widget back(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(top: 4),
        width: 80,
        height: 40,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 16,
          ),
        ),
      ),
    );
  }
}
