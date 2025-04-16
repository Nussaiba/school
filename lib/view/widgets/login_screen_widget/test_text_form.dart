import 'package:flutter/material.dart';
import 'package:school/core/constants/app_color.dart';
import 'package:school/core/constants/app_padding.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.labeltext,
     this.iconData,
    this.mycontroller,
    this.obscureText,
    this.onTapIcon,
    this.valid,
  });
  final String labeltext;
  final IconData ?iconData;
  final TextEditingController? mycontroller;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final String? Function(String?)? valid;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
          color: AppColor.kTextBlackColor,
          fontSize: 17.0,
          fontWeight: FontWeight.w300),
            controller: mycontroller,
        obscureText: obscureText == null || obscureText == false ? false : true,
      decoration: InputDecoration(
          labelText: labeltext,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isDense: true,
          suffixIcon: IconButton(
              onPressed: onTapIcon,
              icon: Icon(
               iconData
              ),
              iconSize: AppPadding.kDefaultPadding)),
      validator: valid,
    );
  }
}
