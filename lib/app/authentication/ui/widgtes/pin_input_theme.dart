import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../_commons/vibe_ui/palette/vui_palette.dart';

var defaultPinInputTheme = PinTheme(
  width: 80,
  height: 60,
  textStyle: TextStyle(
    fontSize: 25,
    color: VUIPalette.black.withOpacity(0.6),
    fontWeight: FontWeight.w600,
  ),
  decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(8),
  ),
);

final errorPinTheme = defaultPinInputTheme.copyDecorationWith(
    border: Border.all(
  color: Colors.red,
));

final focusedPinTheme = defaultPinInputTheme.copyDecorationWith(
  border: Border.all(
    color: VUIPalette.primaryColor,
  ),
);

final submittedPinTheme = defaultPinInputTheme.copyWith(
  decoration: defaultPinInputTheme.decoration?.copyWith(color: VUIPalette.primaryColor),
);
