import 'package:flutter/material.dart';
import 'package:vibe/app/_commons/extensions.dart';

import 'palette/vui_palette.dart';
import 'typography/vui_text.dart';

class VUIButtons {
  static Widget icon({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? textColor,
    double? width,
    double? height,
  }) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 40,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: backgroundColor,
          textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }

  static Widget text({
    required String label,
    required VoidCallback onPressed,
    Color? textColor,
    double? width,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return SizedBox(
      width: width ?? 130,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
        onPressed: onPressed,
        child: VUIText.content(
          label,
          color: textColor ?? VUIPalette.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

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
            borderRadius: BorderRadius.circular(10),
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

  static Widget close(
    BuildContext context, {
    Function? onTap,
    Color? color,
  }) {
    return InkWell(
      onTap: () => onTap != null ? onTap() : Navigator.of(context).pop(),
      child: Material(
        elevation: 10,
        child: Container(
          height: 50,
          color: Colors.transparent,
          child: Row(
            children: [
              Icon(
                Icons.close,
                size: 15,
                color: Colors.grey.shade600,
              ).paddingOnly(top: 2),
              const SizedBox(width: 2),
              VUIText.content(
                'close',
                color: color ?? Colors.grey.shade600,
                fontsize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
