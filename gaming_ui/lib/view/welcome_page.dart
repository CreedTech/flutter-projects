import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gaming_ui/style/style.dart';
import 'package:gaming_ui/view/login_page.dart';
import 'package:get/get.dart';
import 'get_started_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 80),
            child: SvgPicture.asset(
              "assets/undraw_swipe_re_vhc5.svg", height: 300,
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Column(
              children: const [
                TextWidget(
                  text: "Welcome",
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                TextWidget(
                  text: "We're so glad you're here",
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StyledButtons(
                  text: 'Login',
                  press: () => Get.to(const LoginPage()),
                  color: kPrimaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                StyledButtons(
                  text: 'Signup',
                  press: () => Get.to(const GetStarted()),
                  color: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
