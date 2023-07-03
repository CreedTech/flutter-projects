import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/size_config.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput(
      {Key? key,
      required this.text,
      required this.iconName,
      required this.lText})
      : super(key: key);

  final String text;
  final IconData iconName;
  final String lText;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 68.3,
            SizeConfig.screenWidth! / 20.55,
            SizeConfig.screenHeight! / 34.15),
        child: TextField(
          style: TextStyle(
            color: textColor,
          ),
          cursorColor: textColor,
          decoration: InputDecoration(
              prefixIcon: Icon(iconName),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(
                  width: SizeConfig.screenWidth! / 205.5, // 2
                  color: textColor,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(width: 1, color: textHint),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: text,
              hintStyle: TextStyle(color: textHint.withOpacity(0.3)),
              labelText: lText,
              labelStyle: TextStyle(color: textHint.withOpacity(0.6))),
        ),
      ),
    );
  }
}
