import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/shared/style/my_colors.dart';

class DrawerTab extends StatelessWidget {
  Function onClick;
  DrawerTab({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.whiteColor,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        children: [
          Container(
            height: 110,
            color: MyColors.primaryColor,
            child: Center(
              child: Text(
                "app_name".tr(),
                style: GoogleFonts.poppins(
                    color: MyColors.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 12,),
          InkWell(
            onTap: (){
              onClick(true);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.format_list_bulleted_rounded, color:  MyColors.blackColor, size: 24,),
                  const SizedBox(width: 8,),
                  Text("categories".tr(), style: GoogleFonts.poppins(
                      color: MyColors.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          ),
          const SizedBox(height: 12,),
          InkWell(
            onTap: (){
              onClick(false);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.settings, color:  MyColors.blackColor, size: 24,),
                  const SizedBox(width: 8,),
                  Text("settings".tr(), style: GoogleFonts.poppins(
                      color: MyColors.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
