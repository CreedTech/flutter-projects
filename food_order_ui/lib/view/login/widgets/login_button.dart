import 'package:flutter/material.dart';
import '../../home_page/home_page.dart';
import '../../styles/colors.dart';
import '../../styles/size_config.dart';

class LoginButtonColor extends StatefulWidget {
  const LoginButtonColor({Key? key}) : super(key: key);

  @override
  _LoginButtonColorState createState() => _LoginButtonColorState();
}

class _LoginButtonColorState extends State<LoginButtonColor> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        SizeConfig.screenWidth! / 20.55,
        SizeConfig.screenHeight! / 7.59,
        SizeConfig.screenWidth! / 20.55,
        SizeConfig.screenHeight! / 45.54,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 5.0,
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.0, 1.0],
            colors: [
              buttonColor,
              lightColor,
            ],
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(Size(
                SizeConfig.screenWidth! / 1.37,
                SizeConfig.screenHeight! / 13.66)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePageView()));
          },
          child: Text(
            "LOGIN",
            style: TextStyle(
              fontSize: SizeConfig.screenHeight! / 42.68,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ), // 16
          ),
        ),
      ),
    );
  }
}
