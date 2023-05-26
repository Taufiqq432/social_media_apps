
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/component/color.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:social_media_app/utils/utils.dart';
import 'package:social_media_app/view_services/services/session_service.dart';

class ProfileController with ChangeNotifier{
  DatabaseReference refe=FirebaseDatabase.instance.ref().child('User');
  firebase_storage.FirebaseStorage storage= firebase_storage.FirebaseStorage.instance;
  final picker=ImagePicker();
  XFile? _image;
  XFile? get image=>_image;
  bool _loading=false;
  bool get loading=>_loading;
  setLoading(bool value){
    _loading=value;
    notifyListeners();
  }
Future pickGalleryImage(BuildContext context)async{
  final pickFile=await picker.pickImage(source: ImageSource.gallery,imageQuality: 100);
  if(pickFile!=null){
    _image=XFile(pickFile.path);
    uploadImages(context);
    notifyListeners();
  }

}
  Future pickCameraImage(BuildContext context)async{
    final pickFile=await picker.pickImage(source: ImageSource.camera,imageQuality: 100);
    if(pickFile!=null){
      _image=XFile(pickFile.path);
      uploadImages(context);
      notifyListeners();
    }

  }

  void pickImages(context){
    showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        content: Container(
          height: 120,
          child: Column(
            children: [
              ListTile(
                onTap: (){
                  pickCameraImage(context);
                  Navigator.pop(context);
                },
                leading: Icon(Icons.camera,color: AppColors.primaryIconColor,),
                title: Text('Camera'),
              ),
              ListTile(
                onTap: (){
                  pickGalleryImage(context);
                  Navigator.pop(context);
                },
                leading: Icon(Icons.image,color: AppColors.primaryIconColor,),
                title: Text('Gallary'),
              )
            ],
          ),
        ),
      );
        }
        );
  }

  void uploadImages(BuildContext context)async{
    setLoading(true);
  firebase_storage.Reference refs=firebase_storage.FirebaseStorage.instance.ref(
      'profileimage'+SessionController().userid.toString());
  firebase_storage.UploadTask uploadTask=refs.putFile(File(image!.path).absolute);
await Future.value(uploadTask);
final url= await refs.getDownloadURL();
refe.child(SessionController().userid.toString()).update({
  'profile_image':url
}).then((value) {
  setLoading(false);
  Utils.toastMessage('profile update successfully');
  _image=null;
}).onError((error, stackTrace){
  setLoading(false);
  Utils.toastMessage(error.toString());
});
}

}