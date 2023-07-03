import 'package:flutter/material.dart';
import 'package:gaming_ui/style/style.dart';
import 'package:gaming_ui/view/welcome_page.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = const PageDecoration(
      imageFlex: 1,
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyTextStyle: TextStyle(fontSize: 19.0, color: Colors.black),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      boxDecoration: BoxDecoration(color: Color(0xfffffefe)),
    );
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      // main background of screen
      pages: [
        PageViewModel(
          title: "Fast Pick - up",
          body:
              "We provide fast pick up for your \n package we are highly reliable",
          image: introImage('assets/redDead.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Affordable Delivery",
          body:
              "We provide fast pick up for your \n package we are highly reliable",
          image: introImage('assets/fortnite.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Easy Tracking",
          body:
              "We provide fast pick up for your \n package we are highly reliable",
          image: introImage('assets/redDead.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Fast Pick - up",
          body:
              "We provide fast pick up for your \n package we are highly reliable",
          image: introImage('assets/fortnite.jpg'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => Get.to(const WelcomePage()),
      onSkip: () => Get.to(const WelcomePage()),
      showSkipButton: true,
      skipFlex: 0,
      skip: const TextWidget(
        text: 'Skip',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      next: const NextAndContinueContainer(
        containerText: TextWidget(
          text: 'Next',
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w300,
          textAlign: TextAlign.center,
        ),
      ),
      done: const NextAndContinueContainer(
        containerText: TextWidget(
          text: 'Continue',
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          // size of dots
          color: Colors.black45,
          // color of dots
          activeSize: Size(22.0, 10.0),
          activeColor: kPrimaryColor,
          // active dot color
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          )),
    );
  }
}
