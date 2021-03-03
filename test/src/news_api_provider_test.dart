import 'package:tutorial_flutter/src/resource/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';  
import 'package:http/testing.dart';

void main(){
  test("FetchTopIds return a list", () async {
    final newsApi = NewsApiProvider();

    // Override client object with MockClient Fake Response Data
    newsApi.client = MockClient((request) async {
      // Fake Data For Response
      return Response(json.encode([1, 2, 3, 4]), 200);
    });

    final data = await newsApi.fetchTopIds();
    expect(data, [1, 2, 3, 4]);  
  });

  test("FetchItem return ID", () async {
    final newApis = NewsApiProvider();
    newApis.client = MockClient((request) async {
      return Response(json.encode({'id': 123}), 200);
    });

    final item = await newApis.fetchItem(123);
    expect(item.id, 123);
  });
}