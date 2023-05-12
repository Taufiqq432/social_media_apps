import 'dart:async';
import 'package:flutter/material.dart';
import 'package:social_media_app/utils/routes/routes_name.dart';

class SplashServices{
  void isLogin(BuildContext context){
    Timer(Duration(seconds: 3),()=>Navigator.pushNamed(context, RouteName.loginScreen));
  }
}