import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:news_app/shared/style/my_colors.dart';

class CategoryModel {
  String id;
  String title;
  String imgPath;
  Color color;

  CategoryModel({required this.id,
    required this.title,
    required this.imgPath,
    required this.color});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(id: "sports",
          title: "sports".tr(),
          imgPath: "assets/images/ic_sports.png",
          color: MyColors.sportsColor),
      CategoryModel(id: "business",
          title: "business".tr(),
          imgPath: "assets/images/ic_bussines.png",
          color: MyColors.businessColor),
      CategoryModel(id: "entertainment",
          title: "enter".tr(),
          imgPath: "assets/images/ic_env.png",
          color: MyColors.environmentColor),
      CategoryModel(id: "science",
          title: "science".tr(),
          imgPath: "assets/images/ic_science.png",
          color: MyColors.scienceColor),
      CategoryModel(id: "health",
          title: "health".tr(),
          imgPath: "assets/images/ic_health.png",
          color: MyColors.healthColor),
      CategoryModel(id: "technology",
          title: "tech".tr(),
          imgPath: "assets/images/ic_politics.png",
          color: MyColors.politicsColor),
      CategoryModel(id: "general",
          title: "general".tr(),
          imgPath: "assets/images/ic_env.png",
          color: MyColors.environmentColor.withBlue(150).withRed(50)),
    ];
  }
}
