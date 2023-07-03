import 'package:flutter/material.dart';
import 'package:food_order_ui/view/styles/size_config.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight!/20,
      width: SizeConfig.screenWidth!/10,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.25),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
        color: Colors.white,
      ),
    );
  }
}
