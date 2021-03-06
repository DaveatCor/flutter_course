import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:tutorial_flutter/src/model/items_m.dart';

class NewsDbProvider {
  Database db;

  init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "items.db");
    db = await openDatabase(
      path, 
      version: 1,
      onCreate: (Database newDb, int version){
        
      }
    )
  }
}