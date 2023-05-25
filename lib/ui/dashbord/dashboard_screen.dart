import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:social_media_app/ui/dashbord/profile/profile_screen.dart';
import 'package:social_media_app/utils/routes/routes_name.dart';
import 'package:social_media_app/view_services/services/session_service.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final controller=PersistentTabController(initialIndex: 0);
  List <Widget>_buildScreen(){
return [
  const Text('home'),
  const Text('profile'),
  const Text('message'),
  const Text('settings'),
  Profile_Screen()
  ];
  }
 List<PersistentBottomNavBarItem>buildItems(){
    return[
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
        inactiveIcon:  const Icon(Icons.home,color: Colors.black,)

      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.message),
          inactiveIcon:  const Icon(Icons.message,color: Colors.black,)
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.add),
          inactiveIcon:  const Icon(Icons.add,color: Colors.black,)
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          inactiveIcon:  const Icon(Icons.settings,color: Colors.black,)
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          inactiveIcon:  const Icon(Icons.person,color: Colors.black,)
      )
    ];
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('welcome'),
        actions: [
          IconButton(onPressed: (){

            FirebaseAuth auth= FirebaseAuth.instance;
            auth.signOut().then((value) => ({
              SessionController().userid='',
              Navigator.pushNamed(context, RouteName.loginScreen)
            }));
          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: PersistentTabView(
        context,
    screens: _buildScreen(),
    items:buildItems() ,
    navBarStyle: NavBarStyle.style13,
      )
    );



  }
}
