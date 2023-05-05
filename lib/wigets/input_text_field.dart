import 'package:flutter/material.dart';
import 'package:social_media_app/component/color.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController mycontroller;
  final FocusNode focusnode;
  final FormFieldValidator validator;
  final FormFieldSetter onfieldsubmited;
  final TextInputType keyBordType;
  final String hint;
  final bool obsecureText;
  final bool enable, autoFocus;
  const InputTextField(
      {Key? key,
      required this.mycontroller,
      required this.focusnode,
      required this.onfieldsubmited,
      required this.keyBordType,
      required this.obsecureText,
      required this.hint,
      required this.validator,
      this.enable = true,
      this.autoFocus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.dialogAlertBackgroundColor,
      controller: mycontroller,
      focusNode: focusnode,
      onFieldSubmitted: onfieldsubmited,
      validator: validator,
      keyboardType: keyBordType,
      style: Theme.of(context).textTheme.bodyText2,
      obscureText: obsecureText,
      decoration: InputDecoration(
          hintText: hint,
          enabled: enable,
          contentPadding: EdgeInsets.all(15),
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: AppColors.primaryTextTextColor.withOpacity(0.8)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.textFieldDefaultFocus),

          ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.secondaryColor),

        ),

      ),
    );
  }
}
