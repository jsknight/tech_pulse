import 'package:tech_pulse/src/models/item_model.dart';
import 'dart:async';
import 'package:tech_pulse/src/resources/news_api_provider.dart';
import 'package:tech_pulse/src/resources/news_db_provider.dart';

class Repository {
  NewsDbProvider dbProvider = NewsDbProvider();
  NewsApiProvider apiProvider = NewsApiProvider();
  
  fetchTopIds(){
    return apiProvider.fetchTopIds();
  }
  
  fetchItem(int id) async {
    var item = await dbProvider.fetchIem(id);

    if(item != null){
      return item;
    }

    item = await apiProvider.fetchItem(id);
    dbProvider.addItem(item);

    return item;
  }

}