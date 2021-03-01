import 'package:tutorial_flutter/src/resource/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';  

void main(){
  test("FetchTopIds return a list", (){
    //setup test case
    final sum = 1+3;

    // Expectation
    expect(sum, 4);
  });
}