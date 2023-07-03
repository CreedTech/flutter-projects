import 'package:firebase_tutorial/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({Key? key}) : super(key: key);

  @override
  _PhoneLoginPageState createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  final formKey = GlobalKey<FormState>();
  late String phoneNo, verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Enter Phone Number',
                ),
                onChanged: (val){
                  setState(() {
                    phoneNo = val;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: ElevatedButton(
                onPressed: () {
                  verifyPhone(phoneNo);
                },
                child: const Center(
                    child: Text('Login'),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith((states) => 7.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> verifyPhone(phoneNo) async {

    final PhoneVerificationCompleted verified = (AuthCredential authResult){
      AuthService().signIn(authResult);
    };
    final PhoneVerificationFailed verificationFailed = (exception){
      print('${exception.message}');
    };
    final PhoneCodeSent smsSent = (String verId, [int? forceResend]){
      verificationId = verId;
    };
    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId){
      verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
