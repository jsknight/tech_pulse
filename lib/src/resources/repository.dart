import 'package:tech_pulse/src/models/item_model.dart';
import 'dart:async';
import 'package:tech_pulse/src/resources/news_api_provider.dart';
import 'package:tech_pulse/src/resources/news_db_provider.dart';

class Repository {
  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider()
  ];
  List<Cache> caches = <Cache>[
    newsDbProvider
  ];

  // Todo - Iterate over sources when dbprovider
  // get fetchTopIds is implemented
  Future<List<int>> fetchTopIds(){
    return sources[1].fetchTopIds();
  }
  
  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    Source source;

    for( source in sources){
      item = await source.fetchItem(id);
      if(item != null){
        break;
      }
    } 

    for (var cache in caches){
      cache.addItem(item);
    }

    return item;

  }

}

abstract class Source{
  Future<List<int>> fetchTopIds();
  Future<ItemModel> fetchItem(int id);
}

abstract class Cache{
  Future<int> addItem(ItemModel item);
}