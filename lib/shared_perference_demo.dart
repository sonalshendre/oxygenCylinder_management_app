

import 'package:shared_preferences/shared_preferences.dart';

class SharedPeferrenceDemo{
  static SharedPreferences? pref;

  static Future initPref() async {
    pref = await SharedPreferences.getInstance();
  }

  static addData({String value= '',String key ='' }){
    pref!.setString(key, value);
  }

  static String? getData({String key =''}){
    String? data = pref!.getString(key);
    return data;
  }

   static dispose(){
    pref!.clear();
   }

}