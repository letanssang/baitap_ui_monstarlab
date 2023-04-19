import 'package:baitap_ui/screen_size.dart';
import 'package:baitap_ui/widget/custom_button.dart';
import 'package:baitap_ui/widget/welcome_box.dart';
import 'package:flutter/material.dart';

import '../../widget/yellow_background.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: YellowBackground(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin: EdgeInsets.symmetric(vertical: ScreenSize().screenHeight * 0.12),
                      child: welcomeBox(borderTopRight: false))),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(
                        top: 45, left: 45, right: 35, bottom: 47),
                    margin: const EdgeInsets.only(
                        bottom: 0, left: 0, right: 52,),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFD76D),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          onTap: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          enable: true,
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        CustomButton(
                          onTap: () {
                            Navigator.of(context).pushNamed('/register');
                          },
                          enable: true,
                          child: const Text('Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              )),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
