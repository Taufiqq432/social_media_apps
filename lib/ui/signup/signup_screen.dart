import 'package:flutter/material.dart';
import 'package:social_media_app/component/color.dart.';
import 'package:social_media_app/utils/routes/routes_name.dart';
import 'package:social_media_app/utils/utils.dart';
import 'package:social_media_app/wigets/input_text_field.dart';
import 'package:social_media_app/wigets/round_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formkey=GlobalKey<FormState>();
  final emailcontroller=TextEditingController();
  final usernamecontroller=TextEditingController();
  final passwordcontroller=TextEditingController();
  final passwordfocusnode=FocusNode();
  final emailfocusnode= FocusNode();
  final userfocusnode=FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    usernamecontroller.dispose();
    userfocusnode.dispose();
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
                Text('Enter your email address\n to register app',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,),
                SizedBox(height:height*.01 ,),
                Form(
                    key: formkey,
                    child: Padding(
                      padding:  EdgeInsets.only(top: height*.06,bottom: height*0.04),
                      child: Column(
                        children: [
                          InputTextField(
                              mycontroller: usernamecontroller,
                              focusnode: userfocusnode,
                              onfieldsubmited: (value){
                                Utils.fieldFocus(context, userfocusnode, emailfocusnode);
                              },
                              keyBordType: TextInputType.text,
                              obsecureText: false,
                              hint: 'Enter your name',
                              labelText: 'Name',
                              validator: (value){
                                return value.isEmpty?'enter username':null;
                              }
                          ),
                          SizedBox(height:height*.01 ,),
                          InputTextField(
                              mycontroller: emailcontroller,
                              focusnode: emailfocusnode,
                              onfieldsubmited: (value){
                                Utils.fieldFocus(context, emailfocusnode, passwordfocusnode);
                              },
                              keyBordType: TextInputType.emailAddress,
                              obsecureText: false,

                              hint: 'xyz@gmail.com',
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
                              obsecureText:true,
                              labelText: 'password',
                              validator: (value){
                                return value.isEmpty?'enter password':null;

                              })
                        ],
                      ),
                    )),

                SizedBox(height: height*0.01,),
                RoundButton(
                  title: 'Sign up',
                  color: AppColors.secondaryColor,
                  onPress: () {},
                ),
                SizedBox(height: height*0.01,),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RouteName.loginScreen);
                  },
                  child: Text.rich(
                      TextSpan(
                          text: "Already have an account?",
                          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 15),
                          children: [
                            TextSpan(
                                text: 'Login',
                                style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 15,decoration: TextDecoration.underline)
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
