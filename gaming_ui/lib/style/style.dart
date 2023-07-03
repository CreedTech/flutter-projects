import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaming_ui/view/get_started_page.dart';
import 'package:get/get.dart';

const regularPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 20);
const kWhiteColor = Colors.white;
const kGreyColor = Colors.grey;
const kPrimaryColor = Color(0xff0a32d1);


InputDecoration searchInputCompo() {
  return InputDecoration(
    prefixIcon: const Icon(
      Icons.search,
      color: kGreyColor,
    ),
    hintText: 'Search for games',
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kGreyColor, width: 1),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kGreyColor, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    suffixIcon: const Icon(
      Icons.equalizer,
      color: kGreyColor,
    ),
  );
}
InputDecoration buildInputDecoration(String hintText, IconData _icon) {
  return InputDecoration(
    prefixIcon: Padding(
      padding:  const EdgeInsets.only(
        left: 30, right: 10,),
      child: Icon(
        _icon,
        color: Colors.black,
        size: 18,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40.0),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40.0),
      borderSide: const BorderSide(
        color: Colors.blue,
      ),
    ),
    filled: true,
    hintStyle: const TextStyle(
      fontSize: 16,
      color: Colors.grey,
    ),
    hintText: hintText,
  );
}

class StyledButtons extends StatelessWidget {
  const StyledButtons({
    Key? key, this.text, this.press, this.color, this.padding,
  }) : super(key: key);

  final String? text;
  final Color? color;
  final Function()? press;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: padding,
        primary: color,
      ),
      child: Text(
        text!,
        style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15
        ),
      ),
    );
  }
}


class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key, this.text, this.fontSize, this.color, this.fontWeight, this.textAlign,
  }) : super(key: key);

  final String? text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class NextAndContinueContainer extends StatelessWidget {
  const NextAndContinueContainer({
    Key? key, this.containerText,
  }) : super(key: key);

  final TextWidget? containerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: containerText,
    );
  }
}

Widget introImage(String assetName){
  return Stack(
    children: [
      Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                assetName,
              ),
              fit: BoxFit.cover
          ),
        ),
      ),
    ],
  );
}

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    Key? key, this.text, this.textSpan, this.tap,
  }) : super(key: key);

  final String? text;
  final String? textSpan;
  final Function()? tap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text!,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: textSpan!,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = tap,
          )
        ],
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key, this.text, this.icon, this.primaryColor,
  }) : super(key: key);

  final String? text;
  final IconData? icon;
  final Color? primaryColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Get.to(const GetStarted()),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        primary: primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Text(
              text!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}