import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/news_tab.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

class DataTab extends StatelessWidget {
  String catId;
  DataTab({super.key, required this.catId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: ApiManager.getResources(catId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return  Center(
              child: Text("wrong".tr()),
            );
          }
          var sourcesList = snapshot.data?.sources ?? [];
          return NewsTab(
            sources: sourcesList,
          );
        },
      ),
    );
  }
}
