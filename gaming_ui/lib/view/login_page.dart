import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gaming_ui/style/style.dart';
import 'package:gaming_ui/view/get_started_page.dart';
import 'package:gaming_ui/view/home.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 150,
                  child: SvgPicture.asset(
                    "assets/undraw_welcome_re_h3d9.svg",
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Column(
                children: const [
                  TextWidget(
                    text: "Welcome back!",
                    fontSize: 25,
                  ),
                  TextWidget(
                    text: "Log in to your gaming account",
                    fontSize: 15,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: kPrimaryColor),
                      decoration:
                          buildInputDecoration('Gmail', Icons.person_outline),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: kPrimaryColor),
                    decoration:
                        buildInputDecoration('Password', Icons.lock_outline),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  StyledButtons(
                    text: 'LOGIN',
                    press: () => Get.to(const Home()),
                    color: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 13),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextWidget(
                    text: 'Or connect using',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      AuthButton(
                        text: 'Facebook',
                        icon: FontAwesomeIcons.facebookF,
                        primaryColor: kPrimaryColor,
                      ),
                      AuthButton(
                        text: 'Google',
                        icon: FontAwesomeIcons.google,
                        primaryColor: Color(0xffb30f06),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  RichTextWidget(
                    text: 'Don\'t have an account?',
                    textSpan: ' Sign up',
                    tap: () => Get.to(const GetStarted()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
