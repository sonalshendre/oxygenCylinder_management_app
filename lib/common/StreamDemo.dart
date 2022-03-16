import 'dart:async';

import 'package:rxdart/rxdart.dart';

class StreamBuilderDemo{
  static StreamController <String> textStreamController=BehaviorSubject<String>();

   static Stream <String> get textUpdateStream=> textStreamController.stream;
   static Sink <String> get textUpdateSink =>textStreamController.sink;

   static setUdateText(String val){
     textUpdateSink.add(val);
   }
}