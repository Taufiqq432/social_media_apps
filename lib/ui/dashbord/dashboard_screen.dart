import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/utils/routes/routes_name.dart';
import 'package:social_media_app/view_services/services/session_service.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Welcome')),
        actions: [
          IconButton(onPressed: (){
            FirebaseAuth auth=FirebaseAuth.instance;
            auth.signOut().then((value) {
              SessionController().userid='';
              Navigator.pushNamed(context, RouteName.loginScreen);

            });
          }, icon: Icon(Icons.logout))
        ],


      ),
      body: Column(),
    );
  }
}
