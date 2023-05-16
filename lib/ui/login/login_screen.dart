import 'package:flutter/material.dart';
import 'package:social_media_app/component/color.dart.';
import 'package:social_media_app/utils/routes/routes_name.dart';
import 'package:social_media_app/wigets/input_text_field.dart';
import 'package:social_media_app/wigets/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey=GlobalKey<FormState>();
  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  final passwordfocusnode=FocusNode();
  final emailfocusnode= FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    emailfocusnode.dispose();
    passwordfocusnode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height*1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height:height*.01 ,),
                Text('welcome to app',style: Theme.of(context).textTheme.headline3,),
                SizedBox(height:height*.01 ,),
                Text('Enter your email address\n connect to your account',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,),
                SizedBox(height:height*.01 ,),
                Form(
                  key: formkey,
                    child: Padding(
                      padding:  EdgeInsets.only(top: height*.06,bottom: height*0.02),
                      child: Column(
                  children: [
                      InputTextField(
                          mycontroller: emailcontroller,
                          focusnode: emailfocusnode,
                          onfieldsubmited: (value){},
                          keyBordType: TextInputType.emailAddress,
                          obsecureText: false,

                          labelText: 'Email',
                          validator: (value){
                            return value.isEmpty?'enter email':null;
                          }
                      ),
                    SizedBox(height:height*.01 ,),
                      InputTextField(mycontroller:passwordcontroller
                          , focusnode:passwordfocusnode ,
                          onfieldsubmited: (value){},
                          keyBordType: TextInputType.text,
                          obsecureText:true, labelText: 'Password',
                          validator: (value){
                        return value.isEmpty?'enter password':null;

                          }),


                  ],
                ),
                    )),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot Password',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15,decoration: TextDecoration.underline),),
                ),

                SizedBox(height: height*0.01,),
                RoundButton(
                  title: 'Login',
                  color: AppColors.secondaryColor,
                  onPress: () {},
                ),
                SizedBox(height: height*0.01,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RouteName.singupScreen);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                          style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 16,decoration: TextDecoration.underline)
                      )
                    ]
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
