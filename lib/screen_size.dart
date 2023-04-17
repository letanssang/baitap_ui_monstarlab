import 'package:flutter/widgets.dart';

class ScreenSize {
  static final ScreenSize _singleton = ScreenSize._internal();

  factory ScreenSize() {
    return _singleton;
  }

  ScreenSize._internal();

  late MediaQueryData _mediaQueryData;
  late double screenWidth;
  late double screenHeight;
  late double blockSizeHorizontal;
  late double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}