import 'package:flutter/material.dart';
import 'package:gaming_ui/style/style.dart';
import 'package:gaming_ui/view/login_page.dart';
import 'package:get/get.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: IconButton(
                  alignment: Alignment.topLeft,
                  onPressed: () => Get.to(const LoginPage()),
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    size: 25,
                  ),
                ),
              ),
              Column(
                children: const [
                  TextWidget(
                    text: "Let's Get Started!",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  TextWidget(
                    text:
                        "Create an account to Lazy Gaming to get all features",
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: kPrimaryColor),
                      decoration: buildInputDecoration(
                          "Full Name", Icons.person_outline),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: kPrimaryColor),
                      decoration:
                          buildInputDecoration("Email", Icons.mail_outlined),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: kPrimaryColor),
                      decoration:
                          buildInputDecoration("Phone", Icons.phone_iphone),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: kPrimaryColor),
                      decoration:
                          buildInputDecoration("Password", Icons.lock_outline),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: kPrimaryColor),
                      decoration: buildInputDecoration(
                          "Confirm Password", Icons.lock_outline),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () => Get.off(const LoginPage()),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 13),
                  primary: kPrimaryColor,
                ),
                child: const Text(
                  'CREATE',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              RichTextWidget(
                text: 'Already have an account?',
                textSpan: ' Login here',
                tap: () => Get.to(const LoginPage()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
