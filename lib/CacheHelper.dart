import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';





class CacheHelper{
  static SharedPreferences? sharedPreferences1,sharedPreferences2;
  static bool? check1=false,check2=false;
  static init() async{
    sharedPreferences1=await SharedPreferences.getInstance();
  }
  static Future<bool> putbool({required String key,required bool value}) async{
    // if(key=="check1"){    }
      return sharedPreferences1!.setBool(key, value);
      check1=value;

    // return sharedPreferences!.setBool(key, value);
  }

  static bool? getbool({required String key}){
    // if(key=="check1"){
      return sharedPreferences1!.getBool(key);
    // }

    // return sharedPreferences!.getBool(key);
  }
}