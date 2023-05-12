import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_media_app/view_services/services/splash_services.dart';

import '../../component/fonts.dart';
import 'package:social_media_app/component/color.dart.';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices services =SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    services.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Image(image: AssetImage('assets/images/logo.jpg')),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
                child: Text(
              'Social Media Application',
              style: TextStyle(
                color: Colors.amberAccent,
                  fontFamily: AppFonts.sfProDisplayBold,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            )),
          )
        ],
      )),
    );
  }
}
