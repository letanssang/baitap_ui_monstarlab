import 'package:baitap_ui/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class YellowBackground extends StatelessWidget {
  final Widget? child;
  const YellowBackground({this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Đặt màu cho thanh trạng thái
      statusBarBrightness: Brightness.light, // Đặt độ sáng cho thanh trạng thái
      statusBarIconBrightness: Brightness.light, // Đặt độ sáng cho biểu tượng trên thanh trạng thái
    ));
    return Container(
      width: ScreenSize().screenWidth,
      height: ScreenSize().screenHeight,
      decoration: const BoxDecoration(
        color: Color(0xFFFFB900),
      ),
      child: child,
    );
  }
}
