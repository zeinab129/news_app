import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/shared/style/my_colors.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;

  CategoryItem({super.key, required this.categoryModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: BorderRadius.only(
              topRight: const Radius.circular(25),
              topLeft: const Radius.circular(25),
              bottomLeft:
                  index.isOdd ? const Radius.circular(25) : const Radius.circular(0),
              bottomRight:
                  index.isEven ? const Radius.circular(25) : const Radius.circular(0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset(categoryModel.imgPath)),
            const SizedBox(height: 8,),
            Text(
              categoryModel.title,
              style: GoogleFonts.exo(
                  color: MyColors.whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
