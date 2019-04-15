import 'package:rxdart/rxdart.dart';
import 'package:tech_pulse/src/models/item_model.dart';
import 'package:tech_pulse/src/resources/repository.dart';

class StoriesBloc{
  final _topIds = PublishSubject<List<int>>();
  
  // Getters to Streams
  Observable<List<int>> get topIds => _topIds.stream;


  dispose() {
    _topIds.close();
  }
  
}