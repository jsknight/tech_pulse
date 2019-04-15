import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'package:tech_pulse/src/models/item_model.dart';
import 'package:tech_pulse/src/resources/repository.dart';

class NewsDbProvider implements Source, Cache{
  Database db;

  NewsDbProvider(){
    init();
  }

  void init() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    final path = join(documentsDir.path, "items.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
          CREATE TABLE Items
          (
            id INTEGER PRIMARY KEY,
            type TEXT,
            by TEXT,
            time, INTEGER,
            text TEXT,
            parent INTEGER,
            kids BLOB,
            dead INTEGER,
            deleted INTEGER,
            url TEXT,
            score INTEGER,
            title TEXT,
            descendants INTEGER
          )
        """);
      }
    );
  }

  // Todo - store and fetch top ids
  Future<List<int>> fetchTopIds(){
    return null;
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(
      "Items",
      columns: null,
      where: "id = ?",
      whereArgs: [id],
    );

    if(maps.length > 0){
      return ItemModel.fromDb(maps.first);
    }

    return null;
  }

  Future<int> addItem(ItemModel item){
    return db.insert("Items", item.toMapForDB());
  }
}

final newsDbProvider = NewsDbProvider();