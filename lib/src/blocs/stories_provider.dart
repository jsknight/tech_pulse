import 'package:flutter/material.dart';
import 'package:tech_pulse/src/blocs/stories_bloc.dart';

class StoriesProvider extends InheritedWidget{
  final StoriesBloc bloc;
  StoriesProvider({Key key, Widget child})
    : bloc = StoriesBloc(),
      super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static StoriesBloc of(BuildContext context) {
    return (context.ancestorInheritedElementForWidgetOfExactType(StoriesProvider) as StoriesProvider).bloc;
  }
}