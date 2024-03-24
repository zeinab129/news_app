import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier{
  String languageCode = "en";
  String searchString = "";

  void changeLanguage(String langCode) {
    languageCode = langCode;
    notifyListeners();
  }

  void setSearchString(String search){
    searchString = search;
    notifyListeners();
  }

  String getSearchString(){
    return searchString;
  }

}