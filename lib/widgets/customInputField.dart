import 'package:auto_world/config/theme.dart';
import 'package:flutter/material.dart';

typedef ValueCallback(String value);

class CustomInputField extends StatelessWidget {
  String labelText;
  ValueCallback validator;
  ValueCallback onFieldSubmit;

  bool isPassword;

  FocusNode focusNode;
  TextEditingController controller;

  TextInputType textInputType;
  TextInputAction textInputAction;
  int maxLines = 1;

  CustomInputField({
    this.labelText,
    this.validator,
    this.isPassword = false,
    this.controller,
    this.focusNode,
    this.textInputType,
    this.textInputAction,
    this.onFieldSubmit,
    this.maxLines = 1
  });

  @override
  Widget build(BuildContext context) {
        // TODO: implement build
    return TextFormField(
      textInputAction: textInputAction ?? null,
      focusNode: focusNode ?? null,
      controller: controller ?? null,
      validator: validator,
      cursorColor: primary,
      obscureText: isPassword,
      onChanged: (value){

      },
      onFieldSubmitted: onFieldSubmit ?? null,
      keyboardType: textInputType ?? null,
      maxLines: maxLines ?? null,
      style: TextStyle(color: primary, fontSize: 15),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        labelText: textInputType == TextInputType.multiline ? null : labelText,
        hintText: textInputType == TextInputType.multiline ? labelText : null,
        hasFloatingPlaceholder: textInputType == TextInputType.multiline ? false : true,
        border: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primary,
          ),
        ),
        labelStyle: TextStyle(color: primary, fontSize: 15),
        hintStyle: TextStyle(color: primary, fontSize: 15),
      ),
    );
  }
}
