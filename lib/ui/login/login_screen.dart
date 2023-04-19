import 'package:baitap_ui/screen_size.dart';
import 'package:baitap_ui/widget/custom_button.dart';
import 'package:baitap_ui/widget/custom_text_field.dart';
import 'package:baitap_ui/widget/login_button.dart';
import 'package:flutter/material.dart';

import '../../widget/yellow_background.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  String _email = '';
  final _passwordController = TextEditingController();
  String _password = '';
  bool _obscureText = true;
  bool enableButton = false;
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    List<String>? args =
        ModalRoute.of(context)?.settings.arguments as List<String>?;
    if (args != null) {
      _emailController.text = args[0];
      _passwordController.text = args[1];
      enableButton = true;
    }
  }
  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: YellowBackground(
            child: SafeArea(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed('/register', arguments: _email);
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const Alignment(-0.8, 0),
                  child: Container(
                    margin: EdgeInsets.only(top: ScreenSize().screenHeight * 0.07, bottom: ScreenSize().screenHeight * 0.058),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF333333).withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset:
                                const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomTextField(
                                focusNode: _emailFocusNode,
                                labelText: 'Email',
                                hintText: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                controller: _emailController,
                                onChanged: (value) {
                                  setState(() {
                                    _email = value;
                                    if (_email.isNotEmpty && _password.isNotEmpty) {
                                      enableButton = true;
                                    } else {
                                      enableButton = false;
                                    }
                                  });
                                },
                                icon: const Icon(Icons.email_outlined)),
                            CustomTextField(
                              focusNode: _passwordFocusNode,
                              labelText: 'Password',
                              hintText: 'Password',
                              showPassword: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              controller: _passwordController,
                              onChanged: (value) {
                                setState(() {
                                  _password = value;
                                  if (_email.isNotEmpty && _password.isNotEmpty) {
                                    enableButton = true;
                                  } else {
                                    enableButton = false;
                                  }
                                });
                              },
                              icon: _obscureText
                                  ? const Icon(Icons.visibility_off_outlined)
                                  : const Icon(Icons.visibility_outlined),
                              obscureText: _obscureText,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                            CustomButton(
                              enable: enableButton,
                              onTap: () {
                                Navigator.of(context).pushNamed('/');
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              height: ScreenSize().screenHeight * 0.05,
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 22, left: 30, right: 30),
                              color: const Color(0xFFDCDCDC),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  LoginButton(
                                      imageURI: 'assets/images/google.png',
                                      title: 'Continue with Google'),
                                  LoginButton(
                                      imageURI: 'assets/images/facebook.png',
                                      title: 'Continue with Facebook'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            )),
          )),
    );
  }
}
