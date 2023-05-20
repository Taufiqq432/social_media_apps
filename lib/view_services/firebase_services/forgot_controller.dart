import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/utils/routes/routes_name.dart';
import 'package:social_media_app/utils/utils.dart';

class ForgotpasswordController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading= false;
  bool get loading =>_loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }

  void forgotpassword(BuildContext context, String email, ) async {
    setLoading(true);
    try {
      auth
          .sendPasswordResetEmail(email: email)
          .then((value) {
        Navigator.pushNamed(context, RouteName.loginScreen);
        Utils.toastMessage('Password reset successfully');
        setLoading(false);
      }).onError((error, stackTrace) {
        Utils.toastMessage(error.toString());
        setLoading(false);
      });
    } catch (e) {
      Utils.toastMessage(e.toString());
      setLoading(false);
    }
  }
}
