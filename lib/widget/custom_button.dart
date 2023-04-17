import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  final bool enable;

  const CustomButton({required this.child, required this.onTap, this.enable = false, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: GestureDetector(
        onTap: enable ? onTap : null,
        child: Container(
          decoration: BoxDecoration(
              color: enable ? Theme.of(context).primaryColor : const Color(0xFFCECCC5),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF333333).withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Center(child: child),
          ),
      ),
    );
  }
}
