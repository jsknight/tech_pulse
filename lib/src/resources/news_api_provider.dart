import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:tech_pulse/src/models/item_model.dart';
import 'dart:async';

const _API_URL = "https://hacker-news.firebaseio.com/v0";

class NewsApiProvider{
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    final response = await client.get("$_API_URL/topstories.json");
    final ids = json.decode(response.body);
    return ids;
  }

  Future<ItemModel> fetchItem(int id) async {
    final response = await client.get("$_API_URL/item/$id");
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}