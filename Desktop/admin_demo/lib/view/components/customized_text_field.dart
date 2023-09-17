import 'package:admin_demo/controller/ui_controller.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CustomizedTextField extends StatelessWidget {
  final UiController _uiController = UiController();

  final TextEditingController textEditingController;
  final IconData? prefixIconData;
  final String hintText;
  bool isObsecure;
  bool isEmail;

  CustomizedTextField({
    super.key,
    required this.textEditingController,
    this.prefixIconData,
    required this.hintText,
    this.isObsecure = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          enableSuggestions: false,
          autocorrect: false,
          controller: textEditingController,
          obscureText: isObsecure,
          style:
              TextStyle(color: Colors.white, fontFamily: _uiController.getFont),
          // style: TextStyle(fontFamily: uiController.getFont),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)),
            prefixIcon: Icon(
              prefixIconData,
              color: Colors.white,
            ),
            labelText: hintText,
            labelStyle: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontFamily: _uiController.getFont),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "${hintText} is required";
            }
            if (isEmail) {
              if (!EmailValidator.validate(value)) {
                return "Enter a valid email format";
              }
            }
          },
        ));
  }
}
