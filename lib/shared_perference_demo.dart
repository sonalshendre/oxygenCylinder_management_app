

import 'package:shared_preferences/shared_preferences.dart';

class SharedPeferrenceDemo{
  static SharedPreferences? pref;

  static Future initPref() async {
    pref = await SharedPreferences.getInstance();
  }

  static Future addData({String value= '',String key ='' })async{
    pref!.setString(key, value);
  }

  static String? getData({String key ='', }){
    String? data = pref!.getString(key);
    return data;
  }

  static Future addBoolData({bool value= false ,String key ='' })async{
    pref!.setBool(key, value);
  }

  static bool? getBoolData({String key ='', }){
    bool? data = pref!.getBool(key);
    return data;
  }



   static dispose({String key=''}){
    pref!.remove(key);
   }

}