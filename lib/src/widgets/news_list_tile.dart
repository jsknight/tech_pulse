import 'package:flutter/material.dart';
import 'package:tech_pulse/src/models/item_model.dart';
import 'package:tech_pulse/src/blocs/stories_provider.dart';
import 'dart:async';

class NewsListTile extends StatelessWidget {
  final int itemId;
  NewsListTile({@required this.itemId});

  @override
  Widget build(BuildContext context) {
    final bloc = StoriesProvider.of(context);

    return StreamBuilder(
      stream: bloc.items,
      builder: (context, AsyncSnapshot<Map<int, Future<ItemModel>>> snapshot){
        print("HERE");
        print(snapshot.data);
        if(!snapshot.hasData){
          return Text("Stream still loading");
        }

        return FutureBuilder(
          future: snapshot.data[itemId],
          builder: (BuildContext context, AsyncSnapshot<ItemModel> itemSnapshot) {
            if(!itemSnapshot.hasData){
              return Text("Item Loading $itemId");
            }

            return Text(itemSnapshot.data.title);
          },
        );
      },
    );
  }
}