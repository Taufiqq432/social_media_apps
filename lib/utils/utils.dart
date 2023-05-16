import 'package:flutter/material.dart';
class Utils{
  static void fieldFocus(BuildContext context,FocusNode currentnode,FocusNode nextnode){
    currentnode.unfocus();
    FocusScope.of(context).requestFocus(nextnode);
  }

}