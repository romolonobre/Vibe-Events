import 'package:flutter/material.dart';
import 'package:vibe/app/_commons/extensions.dart';

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
        contentPadding: const EdgeInsets.all(18),
        filled: true,
        fillColor: const Color(0xfff1f2f4),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 14,
        ),
        border: InputBorder.none,
      ),
    ).borderRadius(15);
  }
}
