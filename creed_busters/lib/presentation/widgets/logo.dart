import 'package:creed_busters/common/extensions/size_extensions.dart';
import 'package:creed_busters/presentation/blocs/theme/theme_cubit.dart';
import 'package:creed_busters/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Logo extends StatelessWidget {
  final double height;
  const Logo({Key? key, required this.height})
      : assert(height > 0, 'height should be greater than 0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/logo.png',
      key: const ValueKey('logo_image_key'),
      color: context.read<ThemeCubit>().state == Themes.dark
      ? Colors.white
      : AppColor.vulcan,
      height: height.h,
    );
  }
}
