import 'package:flutter/material.dart';
import 'package:plant_app/screens/home/components/title_with_custom_underline.dart';

import '../../../constants.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    this.title,
    required this.press,
  }) : super(key: key);

  final String? title;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          TitleWithCustomUnderline(text: title),
          const Spacer(),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              padding: MaterialStateProperty.resolveWith(
                (states) => const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding + 10),
              ),
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => kPrimaryColor),
            ),
            onPressed: press,
            child: const Text(
              'More',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}