import 'package:flutter/material.dart';
import 'package:food_order_ui/view/login/widgets/password_text_field.dart';
import 'package:food_order_ui/view/login/widgets/text_field_input.dart';

class RegisterTextField extends StatefulWidget {
  const RegisterTextField({Key? key}) : super(key: key);

  @override
  _RegisterTextFieldState createState() => _RegisterTextFieldState();
}

class _RegisterTextFieldState extends State<RegisterTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        TextFieldInput(
            text: "username",
            iconName: Icons.account_circle,
            lText: "UserName"),
        TextFieldInput(text: "email", iconName: Icons.mail, lText: "Email"),
        PasswordTextField(),
        PasswordTextField(),
      ],
    );
  }
}
