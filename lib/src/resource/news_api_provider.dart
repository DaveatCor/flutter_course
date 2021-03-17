import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:tutorial_flutter/src/model/items_m.dart';

class NewsApiProvider{

  Client client = Client();

  final String _root = 'https://hacker-news.firebaseio.com';

  Future<List<int>> fetchTopIds() async {
    final response = await client.get('$_root/v0/topstories.json?print=pretty');
    return json.decode(response.body);
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get('$_root/v0/item/$id.json');
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}