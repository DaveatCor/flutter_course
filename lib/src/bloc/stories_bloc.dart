import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tutorial_flutter/src/model/items_m.dart';
import 'package:tutorial_flutter/src/resource/repository.dart';

class StoriesBloc {

  final _repository = Repository();

  final _topIds = PublishSubject<List<int>>();

  Stream get topIds => _topIds.stream;

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  void dispose(){
    _topIds.close();
  }

}