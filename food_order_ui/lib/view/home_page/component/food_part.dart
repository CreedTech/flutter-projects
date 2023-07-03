import 'package:flutter/material.dart';

import '../../styles/size_config.dart';

class FoodPart extends StatelessWidget {
  const FoodPart({Key? key, required this.partName}) : super(key: key);
  final String partName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth! / 27.4, // 15.0
          SizeConfig.screenHeight! / 68.3, // 10.0
          SizeConfig.screenWidth! / 41.1, // 10.0
          SizeConfig.screenHeight! / 68.3 // 10.0
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            partName,
            style: TextStyle(
              fontSize: SizeConfig.screenHeight! / 34.15, //20
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black45,
            size: SizeConfig.screenHeight! / 21.35, // 32.0
          ),
        ],
      ),
    );
  }
}
