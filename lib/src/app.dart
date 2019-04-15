import 'package:flutter/material.dart';
import 'package:tech_pulse/src/screens/news_list.dart';
import 'package:tech_pulse/src/blocs/stories_provider.dart';

class App extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: "Tech Pulse",
        home: NewsList(),
      ),
    );
  }
}