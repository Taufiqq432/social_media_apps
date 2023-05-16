import 'package:flutter/material.dart';
import 'package:social_media_app/ui/login/login_screen.dart';
import 'package:social_media_app/ui/signup/signup_screen.dart';
import 'package:social_media_app/utils/routes/routes_name.dart';

import '../../ui/splash/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.singupScreen:
        return MaterialPageRoute(builder: (_)=>const SignupScreen() );

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
