import 'package:flutter/material.dart';
import 'package:food_order_ui/view/styles/colors.dart';
import '../../styles/size_config.dart';

class UserNameText extends StatefulWidget {
  const UserNameText({Key? key}) : super(key: key);

  @override
  _UserNameTextState createState() => _UserNameTextState();
}

class _UserNameTextState extends State<UserNameText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth! / 14.17, // 29.0
          SizeConfig.screenHeight! / 23.55, // 29.0
          SizeConfig.screenWidth! / 11.74, // 35.0
          SizeConfig.screenHeight! / 68.3 // 10.0
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.screenHeight! / 85.38,
                        bottom: SizeConfig.screenHeight! / 113.84), // 8 - 6
                    child: Text(
                      "Hi Username ",
                      style: TextStyle(
                        fontSize: SizeConfig.screenHeight! / 29.7, // 30
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: SizeConfig.screenHeight! / 85.30), // 8.0
                    child: Container(
                      height: SizeConfig.screenHeight! / 22.77, // 30
                      width: SizeConfig.screenWidth! / 13.7, // 30
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/main/waving-hand.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Are You Hungry? ",
                style: TextStyle(
                    fontSize: SizeConfig.screenHeight! / 40.18, // 17
                    color: Colors.black45),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                height: SizeConfig.screenHeight! / 17.07,
                width: SizeConfig.screenWidth! / 10.28,
                decoration: BoxDecoration(
                  color: buttonColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
              ),
              Positioned(
                right: SizeConfig.screenHeight! / 20.55, //20.0
                bottom: SizeConfig.screenWidth! / 62.01, // 11.0
                child: const Text(
                  "3",
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
