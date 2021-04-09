import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'package:path/path.dart';
import 'package:tutorial_flutter/src/model/items_m.dart';
import 'package:tutorial_flutter/src/resource/repository.dart';

class NewsDbProvider implements Source, Cache{
  Database db;

  Future<List<int>> fetchTopIds(){
    return null;
  }

  //BLOB is a big set of data. For use inside SQlite String

  init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "items.db");
    db = await openDatabase(
      path, 
      version: 1,
      onCreate: (Database newDb, int version){
        newDb.execute("""
          CREATE TABLE Items(
            id INTEGER PRIMARY KEY,
            type TEXT,
            by TEXT,
            time INTEGER,
            parent INTEGER,
            kids BLOB,
            dead INTEGER,
            deleted INTEGER,
            score INTEGER,
            title TEXT,
            descendants INTEGER
          )
        """);
      }
    );
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id]
    );

    if (maps.length > 0){
      return ItemModel.fromDb(maps.first);
    }
    return null;
  }

  Future<int> addItem(ItemModel item) async {
    return await db.insert("Items", item.toMap());
  }
}

final newsDbProvider = NewsDbProvider();