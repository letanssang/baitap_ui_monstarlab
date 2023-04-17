import 'package:baitap_ui/screen_size.dart';
import 'package:flutter/material.dart';

Widget welcomeBox({bool borderTopRight = true}) {
  return Container(
    height: ScreenSize().screenHeight * 0.3,
    width: ScreenSize().screenHeight * 0.3,
    decoration: BoxDecoration(
      color: const Color(0xFFFFD76D),
      borderRadius: borderTopRight ? const BorderRadius.all(Radius.circular(70)) : const BorderRadius.only(
        topLeft: Radius.circular(70),
        bottomLeft: Radius.circular(70),
        bottomRight: Radius.circular(70),
      ),
    ),
    child: Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Welcome\n',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'to Flutter',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}