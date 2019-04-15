import 'package:flutter/material.dart';
import 'dart:async';

class NewsList extends StatelessWidget {

  Widget buildList(){
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, index){
        return FutureBuilder(
          future: getFuture(),
          builder: (context, snapshot){
            return Container(height: 80,
            child: snapshot.hasData
              ? Text("Im visible $index")
              : Text("You can't see me $index"),
            );
          },
        );
      },
    );
  }

  getFuture(){
    return Future.delayed(
      Duration(seconds: 2), 
      () => "HI"
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(),
    );
  }
}