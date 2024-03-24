import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/source_response_model.dart';
import 'package:news_app/screens/widget/news_item.dart';
import 'package:news_app/screens/widget/source_item.dart';
import 'package:news_app/shared/network/provider/my_provider.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/shared/style/my_colors.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatefulWidget {
  List<Sources> sources;

  NewsTab({super.key, required this.sources});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              tabs: widget.sources
                  .map((e) => Tab(
                        child: SourceItem(
                            isSelected:
                                widget.sources.elementAt(selectedIndex) == e,
                            source: e),
                      ))
                  .toList(),
            )),
        Expanded(
          child: FutureBuilder(
            future: ApiManager.getNewsData(
                widget.sources[selectedIndex].id ?? "",
                provider.getSearchString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("wrong".tr()),
                );
              }
              var articals = snapshot.data?.articles ?? [];
              if (articals.isEmpty) {
                return Center(
                  child: Text(
                    "no_search_result".tr(),
                    style: GoogleFonts.poppins(
                        color: MyColors.greyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsItem(article: articals[index]);
                  },
                  itemCount: articals.length,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
