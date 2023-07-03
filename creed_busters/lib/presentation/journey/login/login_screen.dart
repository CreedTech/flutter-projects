import 'package:creed_busters/common/constants/size_constants.dart';
import 'package:creed_busters/common/extensions/size_extensions.dart';
import 'package:creed_busters/presentation/journey/login/login_form.dart';
import 'package:creed_busters/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Sizes.dimen_32.h),
              child: Logo(
                key: const ValueKey('logo_key'),
                height: Sizes.dimen_12.h,
              ),
            ),
            Expanded(
              child: LoginForm(
                key: const ValueKey('login_form_key'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
