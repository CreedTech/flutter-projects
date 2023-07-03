import 'package:flutter/material.dart';

import '../../register/register_page.dart';
import '../../styles/colors.dart';
import '../../styles/size_config.dart';

class RegisterButton extends StatefulWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  _RegisterButtonState createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth! / 21,
        0,
        SizeConfig.screenWidth! / 34,
        SizeConfig.screenHeight! / 34,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: registerColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(
                SizeConfig.screenWidth! / 1.5, SizeConfig.screenHeight! / 14)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const RegisterPage()));
          },
          child: Text(
            "SIGNUP",
            style: TextStyle(
              color: buttonColor,
              fontSize: SizeConfig.screenHeight! / 43, // 16
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
