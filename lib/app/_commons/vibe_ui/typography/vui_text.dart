import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../palette/vui_palette.dart';

class VUIText {
  static Widget content(
    String label, {
    double fontsize = 14,
    Color color = VUIPalette.black,
    FontWeight fontWeight = FontWeight.w300,
    TextAlign textAlign = TextAlign.left,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      label,
      textAlign: textAlign,
      maxLines: maxLines,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          fontSize: fontsize,
          fontWeight: fontWeight,
          color: color,
          overflow: overflow,
        ),
      ),
    );
  }

  static Widget title(
    String label, {
    double fontsize = 36,
    Color color = VUIPalette.primaryColor,
    FontWeight fontWeight = FontWeight.w600,
    TextAlign textAlign = TextAlign.left,
  }) {
    return Text(
      label,
      textAlign: textAlign,
      style: GoogleFonts.oswald(
        textStyle: TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: fontsize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }

  static Widget subTitle(
    String label, {
    double fontsize = 22,
    Color color = VUIPalette.black,
    FontWeight fontWeight = FontWeight.w500,
    TextAlign textAlign = TextAlign.left,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      label,
      textAlign: textAlign,
      maxLines: maxLines,
      style: GoogleFonts.oswald(
        textStyle: TextStyle(
          fontSize: fontsize,
          fontWeight: fontWeight,
          color: color,
          overflow: overflow,
        ),
      ),
    );
  }
}
