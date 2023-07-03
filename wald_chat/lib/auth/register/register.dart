import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:wald_chat/auth/login/login.dart';
import 'package:wald_chat/view_models/auth/register_view_model.dart';
import 'package:wald_chat/utils/validations.dart';
import '../../components/password_text_field.dart';
import '../../components/text_form_builder.dart';
import '../../utils/validations.dart';
import '../../widgets/indicators.dart';

// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);
//
//   @override
//   State<Register> createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   @override
//   Widget build(BuildContext context) {
//     RegisterViewModel viewModel = Provider.of<RegisterViewModel>(context);
//     return ModalProgressHUD(
//       inAsyncCall: viewModel.loading,
//       child: Scaffold(
//         key: viewModel.scaffoldKey,
//         body: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
//           children: [
//             const SizedBox(
//               height: 10.0,
//             ),
//             const Text(
//               "Welcome to Wald..\nCreate a new account and connect with friends",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18.0,
//                 fontFamily: 'Poppins',
//               ),
//             ),
//             const SizedBox(
//               height: 30.0,
//             ),
//             buildForm(viewModel, context),
//             const SizedBox(height: 30.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Already have an account? ',
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                         CupertinoPageRoute(builder: (_) => const Login()));
//                   },
//                   child: Text(
//                     'Login',
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
//   buildForm(RegisterViewModel viewModel, BuildContext context) {
//     return Form(
//       key: viewModel.formKey,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: Column(
//         children: [
//           TextFormBuilder(
//             enabled: !viewModel.loading,
//             prefix: Feather.user,
//             hintText: "Username",
//             textInputAction: TextInputAction.next,
//             validateFunction: Validations.validateName,
//             onSaved: (String val) {
//               viewModel.setName(val);
//             },
//             focusNode: viewModel.usernameFN,
//             nextFocusNode: viewModel.emailFN,
//           ),
//           const SizedBox(height: 20.0),
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
//             nextFocusNode: viewModel.countryFN,
//           ),
//           const SizedBox(height: 20.0),
//           TextFormBuilder(
//             enabled: !viewModel.loading,
//             prefix: Feather.map_pin,
//             hintText: "Country",
//             textInputAction: TextInputAction.next,
//             validateFunction: Validations.validateName,
//             onSaved: (String val) {
//               viewModel.setCountry(val);
//             },
//             focusNode: viewModel.countryFN,
//             nextFocusNode: viewModel.passFN,
//           ),
//           const SizedBox(height: 20.0),
//           PasswordFormBuilder(
//             enabled: !viewModel.loading,
//             prefix: Feather.lock,
//             suffix: Feather.eye,
//             hintText: "Password",
//             textInputAction: TextInputAction.next,
//             validateFunction: Validations.validatePassword,
//             obscureText: true,
//             onSaved: (String val) {
//               viewModel.setPassword(val);
//             },
//             focusNode: viewModel.passFN,
//             nextFocusNode: viewModel.cPassFN,
//           ),
//           const SizedBox(height: 20.0),
//           PasswordFormBuilder(
//             enabled: !viewModel.loading,
//             prefix: Feather.lock,
//             hintText: "Confirm Password",
//             textInputAction: TextInputAction.done,
//             validateFunction: Validations.validatePassword,
//             submitAction: () => viewModel.register(context),
//             obscureText: true,
//             onSaved: (String val) {
//               viewModel.setConfirmPass(val);
//             },
//             focusNode: viewModel.cPassFN,
//           ),
//           const SizedBox(height: 25.0),
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
//                 'sign up'.toUpperCase(),
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               onPressed: () => viewModel.register(context),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    RegisterViewModel viewModel = Provider.of<RegisterViewModel>(context);
    return ModalProgressHUD(
      progressIndicator: circularProgress(context),
      inAsyncCall: viewModel.loading,
      child: Scaffold(
        key: viewModel.scaffoldKey,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          children: [
            SizedBox(height: 10.0),
            Text(
              'Welcome to Wooble Social App..\nCreate a new account and connect with friends',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontFamily: 'Roboto-Regular'),
            ),
            SizedBox(height: 30.0),
            buildForm(viewModel, context),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account  ',
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (_) => Login()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
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

  buildForm(RegisterViewModel viewModel, BuildContext context) {
    return Form(
      key: viewModel.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormBuilder(
            enabled: !viewModel.loading,
            prefix: Feather.user,
            hintText: "Username",
            textInputAction: TextInputAction.next,
            validateFunction: Validations.validateName,
            onSaved: (String val) {
              viewModel.setName(val);
            },
            focusNode: viewModel.usernameFN,
            nextFocusNode: viewModel.emailFN,
          ),
          SizedBox(height: 20.0),
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
            nextFocusNode: viewModel.countryFN,
          ),
          SizedBox(height: 20.0),
          TextFormBuilder(
            enabled: !viewModel.loading,
            prefix: Feather.map_pin,
            hintText: "Country",
            textInputAction: TextInputAction.next,
            validateFunction: Validations.validateName,
            onSaved: (String val) {
              viewModel.setCountry(val);
            },
            focusNode: viewModel.countryFN,
            nextFocusNode: viewModel.passFN,
          ),
          SizedBox(height: 20.0),
          PasswordFormBuilder(
            enabled: !viewModel.loading,
            prefix: Feather.lock,
            suffix: Feather.eye,
            hintText: "Password",
            textInputAction: TextInputAction.next,
            validateFunction: Validations.validatePassword,
            obscureText: true,
            onSaved: (String val) {
              viewModel.setPassword(val);
            },
            focusNode: viewModel.passFN,
            nextFocusNode: viewModel.cPassFN,
          ),
          SizedBox(height: 20.0),
          PasswordFormBuilder(
            enabled: !viewModel.loading,
            prefix: Feather.lock,
            hintText: "Confirm Password",
            textInputAction: TextInputAction.done,
            validateFunction: Validations.validatePassword,
            submitAction: () => viewModel.register(context),
            obscureText: true,
            onSaved: (String val) {
              viewModel.setConfirmPass(val);
            },
            focusNode: viewModel.cPassFN,
          ),
          SizedBox(height: 25.0),
          Container(
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
                    Theme.of(context).accentColor),
              ),
              child: Text(
                'sign up'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () => viewModel.register(context),
            ),
          ),
        ],
      ),
    );
  }
}
