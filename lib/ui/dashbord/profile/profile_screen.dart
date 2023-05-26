import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/component/color.dart';
import 'package:social_media_app/view_services/firebase_services/profile-controller.dart';
import 'package:social_media_app/view_services/services/session_service.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  final refe=FirebaseDatabase.instance.ref('User');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ChangeNotifierProvider(
        create: (_)=>ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context,provider,child){
            return  SafeArea(
                child: StreamBuilder(
                  stream: refe.child(SessionController().userid.toString()).onValue,

                  builder: (context ,AsyncSnapshot <DatabaseEvent>snapshot){
                    //print(SessionController().userid.toString());
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }else if(snapshot.hasData){
                      Map<dynamic ,dynamic>map=snapshot.data!.snapshot.value as dynamic;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 13),
                                  child: Center(
                                    child: Container(height: 130,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.primaryIconColor,
                                            width: 5
                                        ),

                                        shape: BoxShape.circle,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: provider.image==null?
                                        map['profile_image'].toString()==""?Icon(Icons.person,size: 50,):
                                        Image(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(map['profile_image'].toString()),

                                          loadingBuilder: (context,child,loadingProgress){
                                            if(loadingProgress==null)return child;
                                            return Center(child: CircularProgressIndicator());
                                          },
                                        ):
                                            Image.file(
                                              File(provider.image!.path).absolute
                                            )
                                      ),

                                    ),

                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    provider.pickImages(context);
                                  },
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: AppColors.primaryIconColor,
                                    child: Icon(Icons.add,color: Colors.white,),
                                  ),
                                )
                              ],
                            ),
                            ListTile(
                              title: Center(child: Text(map['username'],style:Theme.of(context).textTheme.headline4,),),
                            )


                          ],
                        ),
                      );
                    }else{
                      return Text("Something went worng",style: Theme.of(context).textTheme.subtitle1,);
                    }
                  },
                )
            );
          },
        ),
      )
    ) ;
  }
}
