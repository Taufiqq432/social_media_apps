import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/utils/routes/routes_name.dart';

class SplashServices{
  FirebaseAuth auth=FirebaseAuth.instance;
  void isLogin(BuildContext context) {
    final user = auth.currentUser;
    if (user != null) {
      Timer(Duration(seconds: 3), () =>
          Navigator.pushNamed(context, RouteName.dashboardscreen));
    }
    else {
      Timer(Duration(seconds: 3), () =>
          Navigator.pushNamed(context, RouteName.loginScreen));
    }
  }
}