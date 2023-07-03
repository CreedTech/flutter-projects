import 'package:flutter/material.dart';
import 'package:food_order_ui/view/login/login_page.dart';
import 'package:food_order_ui/view/styles/colors.dart';
import 'package:food_order_ui/view/styles/size_config.dart';

class TextSignIn extends StatelessWidget {
  const TextSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth! / 20.55,
        0,
        SizeConfig.screenWidth! / 20.55,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: TextStyle(color: textHint),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: Text(
              "Sign In",
              style: TextStyle(
                  color: buttonColor,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.screenHeight! / 46),
            ),
          ),
        ],
      ),
    );
  }
}
