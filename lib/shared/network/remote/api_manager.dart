import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_data_model.dart';
import 'package:news_app/model/source_response_model.dart';
import 'package:news_app/shared/component/constants.dart';
import 'package:news_app/shared/network/remote/end_points.dart';

class ApiManager {
  static Future<SourceResponse> getResources(String catId) async {
    Uri url = Uri.https(Constants.BASE_URL, EndPoints.sources,
        {Constants.CATEGORY_PARAMETER: catId});
    http.Response response = await http
        .get(url, headers: {Constants.API_KEY_HEADER: Constants.API_KEY_VALUE});

    var json = jsonDecode(response.body);
    return SourceResponse.fromJson(json);
  }

  static Future<NewsDataModel> getNewsData(
      String sourceId, String search) async {
    Uri url = Uri.https(Constants.BASE_URL, EndPoints.newsData, {
      Constants.SOURCES_PARAMETER: sourceId,
      Constants.SEARCH_PARAMETER: search
    });
    http.Response response = await http.get(url, headers: {
      Constants.API_KEY_HEADER: Constants.API_KEY_VALUE,
    });

    var json = jsonDecode(response.body);
    return NewsDataModel.fromJson(json);
  }
}
