import 'package:flutter/material.dart';
import 'package:food_order_ui/view/login/widgets/text_title.dart';
import 'package:food_order_ui/view/start_page/widget/login_button.dart';
import 'package:food_order_ui/view/start_page/widget/register_button.dart';
import 'package:food_order_ui/view/styles/size_config.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: SizeConfig.screenHeight! / 3, //250
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/main/bg.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: SizeConfig.screenWidth! / 2, //225
                height: SizeConfig.screenHeight! / 5, //132
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/main/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  SizeConfig.screenHeight! / 68, //10
                  0,
                  SizeConfig.screenHeight! / 12, //60
                ),
                child: Column(
                  children: [
                    const Center(
                      child: TextTitle(
                        title: "WELCOME",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth! / 10,
                          vertical: SizeConfig.screenHeight! / 137), //40 - 5
                      child: const Center(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consecrated advising elite, sed do emus temper incident ut labor et door magna alia.",
                          style: TextStyle(
                            color: Colors.white60,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const LoginButton(),
              const RegisterButton(),
            ],
          ),
        ],
      ),
    );
  }
}
