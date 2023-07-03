import 'package:flutter/material.dart';
import 'package:food_order_ui/view/login/widgets/text_title.dart';

import '../../styles/size_config.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
          EdgeInsets.only(bottom: SizeConfig.screenHeight! / 27.32), // 25.0
      child: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight! / 2.3732, // 250.0
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/main/background_image.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    width: SizeConfig.screenHeight! / 2.74, // 150
                    height: SizeConfig.screenHeight! / 7.762, // 88
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/main/logo.png'),
                      )),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: SizeConfig.screenHeight! / 68.3),
                    child: const TextTitle(title: "Welcome Back"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
