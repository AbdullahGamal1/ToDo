import 'package:flutter/material.dart';

typedef Myvalidator = String? Function(String?);

class CustomFormField extends StatelessWidget {
  String lable;
  bool isPassword;
  TextInputType keyboardType;
  TextEditingController controller;
  Myvalidator validator;

  CustomFormField(
      {required this.lable,
      required this.validator,
      required this.controller,
      this.isPassword = false,
      this.keyboardType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: lable,
        ),
      ),
    );
  }
}
