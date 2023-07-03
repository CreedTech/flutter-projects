import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiredash/wiredash.dart';

import 'blocs/theme/theme_cubit.dart';
import 'themes/theme_color.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashApp({
    Key? key,
    required this.navigatorKey,
    required this.child,
    required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = context.read<ThemeCubit>().state == Themes.dark;
    return Wiredash(
      projectId: 'creedbusters-y1b86bf',
      secret: 'WIYs_FBoVOLrGc0tBEM4UZLtzkBosyMQ',
      navigatorKey: navigatorKey,
      child: child,
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(
          languageCode: languageCode,
        ),
      ),
      theme: WiredashThemeData(
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,
        secondaryBackgroundColor: isDarkTheme ? AppColor.vulcan : Colors.white,
        dividerColor: isDarkTheme ? AppColor.vulcan : Colors.white,
        primaryTextColor: isDarkTheme ? Colors.white : AppColor.vulcan,
        secondaryTextColor: isDarkTheme ? Colors.white : AppColor.vulcan,
        tertiaryTextColor: isDarkTheme ? Colors.white : AppColor.vulcan,
      ),
    );
  }
}
