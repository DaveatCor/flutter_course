import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:tutorial_flutter/src/model/items_m.dart';

class NewsApiProvider{

  Client _client = Client();

  final String _root = 'https://hacker-news.firebaseio.com';

  fetchTopIds() async {
    final response = await _client.get('$_root/v0/topstories.json?print=pretty');
    final ids = json.decode(response.body);
  }

  fetchItem(int id) async {
    final response = await _client.get('$_root/v0/item/$id.json');
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}