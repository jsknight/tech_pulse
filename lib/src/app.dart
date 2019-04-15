import 'package:flutter/material.dart';
import 'package:tech_pulse/src/screens/news_list.dart';

class App extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tech Pulse",
      home: NewsList(),
    );
  }
}