import 'dart:async';
import 'new_db_provider.dart';
import 'news_api_provider.dart';
import 'package:tutorial_flutter/src/model/items_m.dart';

class Repository{

  List<Source> sources = [
    NewsDbProvider(),
    NewsApiProvider()
  ];

  List<Cache> caches = [
    NewsDbProvider()
  ];

  Future<List<int>> fetchTopIds(){
    return sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    var item = await sources[0].fetchItem(id);
    if (item != null){
      return item;
    }

    item = await sources[0].fetchItem(id);
    await sources[0].addItem(item);
    return item;
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel>fetchItem(int id);
}

abstract class Cache{
  Future<ItemModel>fetchItem(int id);
}