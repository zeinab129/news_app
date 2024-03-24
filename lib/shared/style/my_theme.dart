import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/shared/style/my_colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
    shape: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
    backgroundColor: MyColors.primaryColor,
    centerTitle: true,
    titleTextStyle: GoogleFonts.exo(
        fontSize: 22, fontWeight: FontWeight.w400, color: MyColors.whiteColor),
        iconTheme: const IconThemeData(color: MyColors.whiteColor, size: 30)

  ),


  );
}
