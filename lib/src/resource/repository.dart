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
    var item;
    Source source;

    for(source in sources){
      item = await source.fetchItem(id);
      if (item != null){
        break;
      }
    }
    
    for(var cache in caches){
      cache.addItem(item);
    }
    return item;
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();
  Future<ItemModel>fetchItem(int id);
}

abstract class Cache{
  Future<int> addItem(ItemModel item);
  Future<ItemModel>fetchItem(int id);
}