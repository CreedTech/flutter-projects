import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:wald_chat/auth/register/register.dart';

import '../../components/password_text_field.dart';
import '../../components/text_form_builder.dart';
import '../../utils/validations.dart';
import '../../view_models/auth/login_view_model.dart';
import '../../widgets/indicators.dart';

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     LoginViewModel viewModel = Provider.of<LoginViewModel>(context);
//
//     return ModalProgressHUD(
//       progressIndicator: circularProgress(context),
//       inAsyncCall: viewModel.loading,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         key: viewModel.scaffoldKey,
//         body: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
//           children: [
//             const SizedBox(
//               height: 60,
//             ),
//             SizedBox(
//               height: 170,
//               width: MediaQuery.of(context).size.width,
//               child: Image.asset('assets/images/login.png'),
//             ),
//             const SizedBox(
//               height: 10.0,
//             ),
//             const Center(
//               child: Text(
//                 "Welcome back!",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w900,
//                   fontSize: 23.0,
//                 ),
//               ),
//             ),
//             Center(
//               child: Text(
//                 "Login to your account and get started!",
//                 style: TextStyle(
//                   fontWeight: FontWeight.w300,
//                   fontSize: 12.0,
//                   color: Theme.of(context).colorScheme.secondary,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 25.0,
//             ),
//             buildForm(context, viewModel),
//             const SizedBox(height: 10.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Don\'t have an account?',
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                         CupertinoPageRoute(builder: (_) => const Register()));
//                   },
//                   child: Text(
//                     'Sign Up',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Theme.of(context).colorScheme.secondary,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   buildForm(BuildContext context, LoginViewModel viewModel) {
//     return Form(
//       key: viewModel.formKey,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Column(
//         children: [
//           TextFormBuilder(
//             enabled: !viewModel.loading,
//             prefix: Feather.mail,
//             hintText: "Email",
//             textInputAction: TextInputAction.next,
//             validateFunction: Validations.validateEmail,
//             onSaved: (String val) {
//               viewModel.setEmail(val);
//             },
//             focusNode: viewModel.emailFN,
//             nextFocusNode: viewModel.passFN,
//           ),
//           const SizedBox(height: 15.0),
//           PasswordFormBuilder(
//             enabled: !viewModel.loading,
//             prefix: Feather.lock,
//             suffix: Feather.eye,
//             hintText: "Password",
//             textInputAction: TextInputAction.done,
//             validateFunction: Validations.validatePassword,
//             submitAction: () => viewModel.login(context),
//             obscureText: true,
//             onSaved: (String val) {
//               viewModel.setPassword(val);
//             },
//             focusNode: viewModel.passFN,
//           ),
//           Align(
//             alignment: Alignment.centerRight,
//             child: Padding(
//               padding: const EdgeInsets.only(right: 10.0),
//               child: InkWell(
//                 onTap: () => viewModel.forgotPassword(context),
//                 child: const SizedBox(
//                   width: 130,
//                   height: 40,
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Text(
//                       'Forgot Password?',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10.0),
//           SizedBox(
//             height: 45.0,
//             width: 180.0,
//             child: ElevatedButton(
//               style: ButtonStyle(
//                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(40.0),
//                   ),
//                 ),
//                 backgroundColor: MaterialStateProperty.all<Color>(
//                     Theme.of(context).colorScheme.secondary),
//               ),
//               child: Text(
//                 'Log in'.toUpperCase(),
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               onPressed: () => viewModel.login(context),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    LoginViewModel viewModel = Provider.of<LoginViewModel>(context);

    return ModalProgressHUD(
      progressIndicator: circularProgress(context),
      inAsyncCall: viewModel.loading,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: viewModel.scaffoldKey,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          children: [
            SizedBox(height: 60.0),
            Container(
              height: 170.0,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/login.png',
              ),
            ),
            SizedBox(height: 10.0),
            const Center(
              child: Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Center(
              child: Text(
                'Log into your account and get started!',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            buildForm(context, viewModel),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account?'),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (_) => Register()));
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildForm(BuildContext context, LoginViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormBuilder(
            enabled: !viewModel.loading,
            prefix: Feather.mail,
            hintText: "Email",
            textInputAction: TextInputAction.next,
            validateFunction: Validations.validateEmail,
            onSaved: (String val) {
              viewModel.setEmail(val);
            },
            focusNode: viewModel.emailFN,
            nextFocusNode: viewModel.passFN,
          ),
          const SizedBox(height: 15.0),
          PasswordFormBuilder(
            enabled: !viewModel.loading,
            prefix: Feather.lock,
            suffix: Feather.eye,
            hintText: "Password",
            textInputAction: TextInputAction.done,
            validateFunction: Validations.validatePassword,
            submitAction: () => viewModel.login(context),
            obscureText: true,
            onSaved: (String val) {
              viewModel.setPassword(val);
            },
            focusNode: viewModel.passFN,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: InkWell(
                onTap: () => viewModel.forgotPassword(context),
                child: const SizedBox(
                  width: 130,
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 45.0,
            width: 180.0,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
              // highlightElevation: 4.0,
              child: Text(
                'Log in'.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () => viewModel.login(context),
            ),
          ),
        ],
      ),
    );
  }
}