import 'package:flutter/material.dart';
import 'package:food_order_ui/view/login/widgets/password_text_field.dart';
import 'package:food_order_ui/view/login/widgets/text_field_input.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({Key? key}) : super(key: key);

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        TextFieldInput(
          text: "email",
          iconName: Icons.mail,
          lText: "Email",
        ),
        PasswordTextField(),
      ],
    );
  }
}
