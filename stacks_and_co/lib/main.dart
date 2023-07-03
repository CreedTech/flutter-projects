import 'package:flutter/material.dart';
import 'package:stacks_and_co/dashboard.dart';

const kTextStyle = TextStyle(
  color: Color(0xff4A148C),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _formKey = GlobalKey<FormState>();
  final snackBar =
      const SnackBar(content: Text('hey the text button was clicked'));
  String? name;
  String? email;
  String? password;

  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4A148C),
        title: const Text('Form Validation'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      onChanged: (text) {
                        name = text;
                        setState(() {});
                      },
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'enter field';
                        } else if (text.length <= 5) {
                          return 'user name length should be more than 5';
                        }
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: Colors.purple[900],
                        ),
                        hintText: 'Enter Your Name',
                        label: const Text(
                          'Name',
                          style: kTextStyle,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      onChanged: (text) {
                        email = text;
                        setState(() {});
                      },
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'enter field';
                        } else if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.+]+.[a-z]")
                            .hasMatch(text)) {
                          return 'Please enter a valid Email';
                        }
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.mail,
                          color: Colors.purple[900],
                        ),
                        hintText: 'Enter Your Email Address',
                        label: const Text(
                          'Email',
                          style: kTextStyle,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      onChanged: (text) {
                        password = text;
                        setState(() {});
                      },
                      obscureText: !_passwordVisible,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return 'enter field';
                        } else if (text.length <= 5) {
                          return 'user name length should be more than 5';
                        }
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.password,
                          color: Colors.purple[900],
                        ),
                        hintText: 'Enter Your Password',
                        label: const Text(
                          'Password',
                          style: kTextStyle,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff4A148C),
                          ),
                          onPressed: () => setState(() {
                            _passwordVisible = !_passwordVisible;
                          }),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.purple[900]),
                      padding: MaterialStateProperty.resolveWith(
                        (states) => const EdgeInsets.symmetric(horizontal: 40),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DashBoard(
                            name: name!,
                            email: email!,
                            password: password!,
                          );
                        }));
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
