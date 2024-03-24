import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/shared/network/provider/my_provider.dart';
import 'package:news_app/shared/style/my_colors.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatelessWidget {
  SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    String selectedLanguage = provider.languageCode;
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "language".tr(),
            style: GoogleFonts.poppins(
                color: MyColors.blackColor,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          const SizedBox(
            height: 12,
          ),
          DropdownButtonFormField(
            iconEnabledColor: MyColors.primaryColor,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: MyColors.primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: MyColors.primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: MyColors.primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(8),
                )),
            value: selectedLanguage,
            items: [
              DropdownMenuItem(
                value: "en",
                child: Text(
                  "english".tr(),
                  style: GoogleFonts.inter(
                      color: selectedLanguage == "en"
                          ? MyColors.primaryColor
                          : MyColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              DropdownMenuItem(
                value: "ar",
                child: Text("arabic".tr(),
                    style: GoogleFonts.inter(
                        color: selectedLanguage == "ar"
                            ? MyColors.primaryColor
                            : MyColors.blackColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              )
            ],
            onChanged: (String? lang) {
              provider.changeLanguage(lang ?? "en");
              context.setLocale(Locale(provider.languageCode));
            },
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
