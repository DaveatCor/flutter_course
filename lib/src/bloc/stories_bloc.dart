import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tutorial_flutter/src/model/items_m.dart';
import 'package:tutorial_flutter/src/resource/repository.dart';

class StoriesBloc {

  final _topIds = PublishSubject<List<int>>();

  Stream get topIds => _topIds.stream;

  void dispose(){
    _topIds.close();
  }

}