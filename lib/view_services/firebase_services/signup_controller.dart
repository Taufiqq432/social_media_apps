import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:social_media_app/utils/routes/routes_name.dart';
import 'package:social_media_app/utils/utils.dart';

class SignUpController with ChangeNotifier{
 FirebaseAuth auth =FirebaseAuth.instance;
 DatabaseReference refe =FirebaseDatabase.instance.ref().child('User');
  bool _loading= false;
   bool get loading =>_loading;
   setLoading(bool value){
     _loading=value;
     notifyListeners();
   }
   void signnup(BuildContext context,String username,String email,String password)async{
     setLoading(true);
     try{
        auth.createUserWithEmailAndPassword(
            email: email, password: password
        ).then((value) {

          refe.child(value.user!.uid.toString()).set({
            'uid':value.user!.uid.toString(),
            'username':username,
            'email':value.user!.email.toString(),
            'profile_image':'',
            'phone_number':'',
            'password':password

          }).then((value) {
            Navigator.pushNamed(context,RouteName.loginScreen );
            setLoading(false);
          }).onError((error, stackTrace) {
            Utils.toastMessage(error.toString());
            setLoading(false);
          });
          Utils.toastMessage('upadte successfully');
          setLoading(false);
        }).onError((error, stackTrace) {
          Utils.toastMessage(error.toString());
          setLoading(false);
        });

      }catch(e){
        Utils.toastMessage(e.toString());
        setLoading(false);
      }
   }

}