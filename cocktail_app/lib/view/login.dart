import 'package:cocktail_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  late bool seenPassword;

  @override
  void initState() {
    super.initState();
    seenPassword = false;
  }

  getData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColors,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _key,
            child: SafeArea(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: username,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'empty field';
                        }
                      },
                      decoration: InputDecoration(
                        errorText: '',
                        errorStyle: TextStyle(fontSize: 0,color: Colors.transparent),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        fillColor: kBackgroundColorII,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: kBackgroundColorII),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kBackgroundColorII),
                            borderRadius: BorderRadius.circular(20)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kBackgroundColorII),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kBackgroundColorII),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      obscureText: seenPassword,
                      controller: password,
                      validator: (text) {
                        if (text!.isEmpty) {
                          Get.snackbar('status', 'empty field');
                          return 'empty field';
                        }
                      },
                      decoration: InputDecoration(
                        errorText: '',
                        errorStyle: const TextStyle(fontSize: 0,color: Colors.transparent),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        fillColor: kBackgroundColorII,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: kBackgroundColorII),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kBackgroundColorII),
                            borderRadius: BorderRadius.circular(20)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kBackgroundColorII),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kBackgroundColorII),
                            borderRadius: BorderRadius.circular(20)),
                        suffixIcon: IconButton(
                          icon: Icon(seenPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              seenPassword = !seenPassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    kBackgroundColorII.withOpacity(0.6)),
                            fixedSize: MaterialStateProperty.resolveWith(
                                (states) => const Size(double.maxFinite,50))),
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            if (mounted) {
                              box.put('username', username.text);
                              box.put('password', password.text);
                            }
                            Get.offAll(const MyHome());
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
