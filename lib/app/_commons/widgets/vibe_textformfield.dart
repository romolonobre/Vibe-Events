import 'package:flutter/material.dart';

import '../vibe_ui/palette/vui_palette.dart';

class VIBETextformfield extends StatelessWidget {
  final String hintText;
  final bool capitalizeFirstWord;
  final Function(String)? onChanged;
  final TextInputType keyboardType;

  const VIBETextformfield({
    super.key,
    required this.hintText,
    this.capitalizeFirstWord = false,
    this.onChanged,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      textCapitalization: capitalizeFirstWord ? TextCapitalization.words : TextCapitalization.none,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: VUIPalette.primaryColor),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
