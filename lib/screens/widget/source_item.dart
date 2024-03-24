import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/source_response_model.dart';
import 'package:news_app/shared/style/my_colors.dart';

class SourceItem extends StatelessWidget {
  Sources source;
  bool isSelected;

  SourceItem({required this.isSelected, required this.source, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? MyColors.primaryColor : Colors.transparent,
        border: Border.all(width: 2, color: MyColors.primaryColor),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Text(
        source.name ?? "",
        style: GoogleFonts.exo(
            color: isSelected ? MyColors.whiteColor : MyColors.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
