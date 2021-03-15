import 'dart:async';
import 'new_db_provider.dart';
import 'news_api_provider.dart';
import 'package:tutorial_flutter/src/model/items_m.dart';

class Repository{

  NewsDbProvider dbProvider = NewsDbProvider();
  
  NewsApiProvider apiProvider = NewsApiProvider();

  fetchTopIds(){
    return apiProvider.fetchTopIds();
  }

  fetchItem(int id) async {
    var item = await dbProvider.fetchItem(id);
    if (item != null){
      return item;
    }

    item = await apiProvider.fetchItem(id);
    await dbProvider.addItem(item);
    return item;
  }
}