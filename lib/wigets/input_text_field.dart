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
  final String labelText;
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
      this.autoFocus = false,
      this.labelText=''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        cursorColor: AppColors.dialogAlertBackgroundColor,
        controller: mycontroller,
        focusNode: focusnode,
        onFieldSubmitted: onfieldsubmited,
        validator: validator,
        keyboardType: keyBordType,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(height:0,fontSize: 20),
        obscureText: obsecureText,
        decoration: InputDecoration(
            hintText: hint,
            labelText: labelText,
            enabled: enable,
            contentPadding: EdgeInsets.all(15),
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(height:0,color: AppColors.primaryTextTextColor.withOpacity(0.8)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.textFieldDefaultFocus),

            ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.secondaryColor),

          ),
          errorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.alertColor),

          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.textFieldDefaultBorderColor),

          ),

        ),
      ),
    );
  }
}
