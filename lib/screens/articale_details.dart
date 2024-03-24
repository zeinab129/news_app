import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/news_data_model.dart';
import 'package:news_app/shared/style/my_colors.dart';

class ArticalDetails extends StatelessWidget {
  static const String routeName = "ARTICALE_DETAILS";

  ArticalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Articles article = ModalRoute.of(context)!.settings.arguments as Articles;

    Duration difference =
        DateTime.now().difference(DateTime.parse(article.publishedAt ?? ""));
    String time = "";
    if (difference.inSeconds < 5) {
      time = "now".tr();
    } else if (difference.inMinutes < 1) {
      time =  "${difference.inSeconds} ${"s_ago".tr()}";
    } else if (difference.inHours < 1) {
      time = "${difference.inMinutes} ${"m_ago".tr()}";
    } else if (difference.inHours < 24) {
      time = "${difference.inHours} ${"h_ago".tr()}";
    } else {
      time = "${difference.inDays} ${"d_ago".tr()}";
    }
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage("assets/images/ic_bg.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            "details".tr(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.source?.name ?? "",
                      style: GoogleFonts.poppins(
                          color: MyColors.greyColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      article.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          color: MyColors.newsTitleColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        time,
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(
                            color: MyColors.greyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: MyColors.whiteColor),
                      child: Text(
                        article.description ?? "",
                        style: GoogleFonts.poppins(
                            color: MyColors.newsTitleColor.withOpacity(0.5),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
