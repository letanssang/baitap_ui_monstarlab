import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String imageURI;
  final String title;

  const LoginButton({required this.imageURI, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF333333).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        leading: Image(
          image: AssetImage(imageURI),
          width: 28,
          height: 28,
        ),
        trailing: const Icon(
          Icons.arrow_forward,
          size: 18,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: const TextStyle(
              color: Color(0xFF59000000),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
