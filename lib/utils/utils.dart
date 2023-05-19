import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_media_app/component/color.dart';
class Utils{
  static void fieldFocus(BuildContext context,FocusNode currentnode,FocusNode nextnode){
    currentnode.unfocus();
    FocusScope.of(context).requestFocus(nextnode);
  }
  static void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: AppColors.primaryTextTextColor,
      textColor: AppColors.whiteColor,
      fontSize: 14
    );

  }

}