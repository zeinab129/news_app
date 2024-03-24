import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/screens/widget/category_item.dart';
import 'package:news_app/shared/style/my_colors.dart';

class CategoriesTab extends StatelessWidget {
  Function onClick;

  CategoriesTab({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    var categories = CategoryModel.getCategories();
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            "pick_cat".tr(),
            style: GoogleFonts.poppins(
                color: MyColors.catTitleColor,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 18, mainAxisSpacing: 18),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onClick(categories[index]);
                    },
                    child: CategoryItem(
                      categoryModel: categories[index],
                      index: index,
                    ));
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
