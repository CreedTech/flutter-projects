import 'package:flutter/material.dart';
import 'package:food_order_ui/view/styles/colors.dart';
import '../../styles/size_config.dart';

class TextSignUp extends StatelessWidget {
  const TextSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(SizeConfig.screenWidth! / 20.55,
          SizeConfig.screenHeight! / 136.6, SizeConfig.screenWidth! / 20.55, 0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(color: textHint),
            ),
            GestureDetector(
              onTap: () {
                // Todo create signupPage
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Text(
                "Sign up",
                style: TextStyle(
                    color: buttonColor,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.screenHeight! / 45.54 // 15
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SignUpPage() {}
}
