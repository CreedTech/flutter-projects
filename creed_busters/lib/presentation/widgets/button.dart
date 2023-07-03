import 'package:creed_busters/common/extensions/size_extensions.dart';
import 'package:creed_busters/common/extensions/string_extensions.dart';
import 'package:creed_busters/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';

import '../../common/constants/size_constants.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isEnabled;
  const Button({Key? key, required this.text, required this.onPressed,this.isEnabled = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: isEnabled
        //       ? [AppColor.royalBlue, AppColor.violet]
        //     : [Colors.grey, Colors.grey],
        // ),
        color: isEnabled
        ? AppColor.royalBlue
        : Colors.grey,
        // borderRadius: BorderRadius.all(
        //   Radius.circular(Sizes.dimen_12.w),
        // ),
      ),
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_20.w),
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
      height: Sizes.dimen_16.h,
      child: TextButton(
        key: const ValueKey('main_button'),
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          text.t(context),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
