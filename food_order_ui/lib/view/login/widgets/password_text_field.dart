import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/size_config.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool passwordObscure = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: TextField(
          obscureText: passwordObscure,
          style: TextStyle(color: textColor),
          cursorColor: textColor,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordObscure = !passwordObscure;
                });
              },
              icon: Icon(
                  passwordObscure ? Icons.visibility_off : Icons.visibility),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(
                20.0,
              )),
              borderSide: BorderSide(
                  width: SizeConfig.screenWidth! / 205.5,
                  color: textColor), // 2
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
              borderSide: BorderSide(width: 1, color: textHint),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: "password",
            hintStyle: TextStyle(
              color: textHint.withOpacity(0.3),
            ),
            labelText: "Password",
            labelStyle: TextStyle(
              color: textHint.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}
