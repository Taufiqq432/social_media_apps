
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:social_media_app/component/color.dart.';
import 'package:social_media_app/view_services/firebase_services/forgot_controller.dart';
import 'package:social_media_app/wigets/input_text_field.dart';
import 'package:social_media_app/wigets/round_button.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final emailfocusnode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    emailfocusnode.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * .01,
                ),
                Text(
                  'Welcome to recover password',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 26),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Text(
                  'Enter your email address\n connect to your account',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: height * .01,
                ),
                Form(
                    key: formkey,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * .06, bottom: height * 0.02),
                      child: Column(
                        children: [
                          InputTextField(
                              mycontroller: emailcontroller,
                              focusnode: emailfocusnode,
                              onfieldsubmited: (value) {},
                              keyBordType: TextInputType.emailAddress,
                              obsecureText: false,
                              labelText: 'Email',
                              validator: (value) {
                                return value.isEmpty ? 'enter email' : null;
                              }),
                          SizedBox(
                            height: height * .01,
                          ),
                        ],
                      ),
                    )),

                SizedBox(
                  height: height * 0.01,
                ),
                ChangeNotifierProvider(
                  create: (_) =>ForgotpasswordController(),
                  child: Consumer<ForgotpasswordController>(
                    builder: (context, provider, child) {
                      return RoundButton(
                        loading: provider.loading,
                        title: 'Reset',
                        color: AppColors.secondaryColor,
                        onPress: () {
                          if (formkey.currentState!.validate()) {
                            provider.forgotpassword(context, emailcontroller.text,
                                );
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

