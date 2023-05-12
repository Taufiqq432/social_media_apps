import 'package:flutter/material.dart';
import 'package:social_media_app/component/color.dart.';
import 'package:social_media_app/wigets/input_text_field.dart';
import 'package:social_media_app/wigets/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller=TextEditingController();
  final emailfocusnode= FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputTextField(
                mycontroller: emailcontroller,
                focusnode: emailfocusnode,
                onfieldsubmited: (value){},
                keyBordType: TextInputType.emailAddress,
                obsecureText: false,

                hint: 'Email',
                validator: (value){
                  return value.isEmpty?'enter email':null;
                }
            ),
            const SizedBox(height: 40),
            RoundButton(
              title: 'Login',
              color: AppColors.secondaryColor,
              onPress: () {},
            )
          ],
        ),
      ),
    );
  }
}
