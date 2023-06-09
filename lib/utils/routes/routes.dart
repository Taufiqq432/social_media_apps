import 'package:flutter/material.dart';
import 'package:social_media_app/ui/dashbord/dashboard_screen.dart';
import 'package:social_media_app/ui/forgot_password/forgot_password_screen.dart';
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
      case RouteName.dashboardscreen:
        return MaterialPageRoute(builder: (_)=>const DashboardScreen() );
      case RouteName.forgotpasswordscreen:
        return MaterialPageRoute(builder: (_)=>const ForgotPasswordScreen() );

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
