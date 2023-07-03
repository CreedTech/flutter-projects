import 'package:flutter/material.dart';
import 'package:food_order_ui/view/login/widgets/text_title.dart';
import 'package:food_order_ui/view/styles/size_config.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight! / 4.5, //160
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/main/background_image.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Center(
                  child: TextTitle(
                    title: "Create Account",
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
