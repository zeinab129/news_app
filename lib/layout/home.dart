import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/news_data_model.dart';
import 'package:news_app/screens/categories_tab.dart';
import 'package:news_app/screens/data_tab.dart';
import 'package:news_app/screens/drawer_tab.dart';
import 'package:news_app/screens/setting_tab.dart';
import 'package:news_app/shared/network/provider/my_provider.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/shared/style/my_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HOME_SCREEN";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCategory = true;
  bool searchAppBar = false;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage("assets/images/ic_bg.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: searchAppBar
            ? AppBar(
                title: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SizedBox(
                    height: 45,
                    child: TextField(
                      controller: controller,
                      onChanged: (value) {
                        controller.text = value;
                      },
                        cursorColor: MyColors.primaryColor,
                        style: GoogleFonts.poppins(
                            color: MyColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: MyColors.whiteColor,
                          hintText: "search_articale".tr(),
                          hintStyle: GoogleFonts.poppins(
                              color: MyColors.primaryColor.withOpacity(0.3),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: MyColors.primaryColor, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: MyColors.primaryColor, width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: MyColors.primaryColor, width: 1)),
                          prefixIcon: IconButton(
                              onPressed: () {
                                searchAppBar = false;
                                controller.text = "";
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.cancel,
                                color: MyColors.primaryColor,
                              )),
                          suffixIcon: IconButton(
                            onPressed: (){
                              provider.setSearchString(controller.text);
                            },
                            icon: const Icon(
                              Icons.search,
                              color: MyColors.primaryColor,
                            ),
                          ),
                        )
                    ),
                  ),
                ),
              )
            : AppBar(
                title: Text(categoryModel == null
                    ? isCategory
                        ? "app_name".tr()
                        : "settings".tr()
                    : categoryModel!.title),
                actions: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 24, 0),
                    child: categoryModel != null
                        ? IconButton(
                            onPressed: () {
                              searchAppBar = true;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.search,
                              color: MyColors.whiteColor,
                              size: 32,
                            ),
                          )
                        : null,
                  )
                ],
              ),
        drawer: searchAppBar
            ? null
            : DrawerTab(
                onClick: onDrawerClicked,
              ),
        body: categoryModel == null
            ? isCategory
                ? CategoriesTab(
                    onClick: onCategoryClicked,
                  )
                : SettingTab()
            : DataTab(
                catId: categoryModel!.id,
              ),
      ),
    );
  }

  CategoryModel? categoryModel;

  onCategoryClicked(catModel) {
    categoryModel = catModel;
    setState(() {});
  }

  onDrawerClicked(bool isCat) {
    isCategory = isCat;
    categoryModel = null;
    Navigator.pop(context);
    setState(() {});
  }

}
