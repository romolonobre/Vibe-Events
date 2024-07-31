import 'package:flutter/material.dart';
import 'package:vibe/app/_commons/extensions.dart';
import 'package:vibe/app/_commons/vibe_ui/palette/vui_palette.dart';

import '../../../_commons/vibe_ui/typography/vui_text.dart';

class CategorieButton extends StatefulWidget {
  final Function(String) ontap;
  const CategorieButton({required this.ontap, super.key});

  @override
  State<CategorieButton> createState() => _CategorieButtonState();
}

class _CategorieButtonState extends State<CategorieButton> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 20),
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final categorie = categories[index];
        final isSelected = selectedCategoryIndex == index;

        return GestureDetector(
          onTap: () {
            widget.ontap(categorie);
            selectedCategoryIndex = index;
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.only(left: 18, right: 18),
            decoration: BoxDecoration(
              color: isSelected ? VUIPalette.primaryColor : Colors.white,
              border: Border.all(
                width: 0.6,
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: VUIText.content(
                categorie,
                fontsize: 14,
                color: isSelected ? Colors.white : Colors.grey.shade600,
              ),
            ),
          ).paddingAll(5),
        );
      },
    );
  }
}

List<String> categories = [
  "All",
  "Music",
  "Comedy",
  "Theater",
  "Stand up",
];
