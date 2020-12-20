import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Commons{

  static const hintColor = Color(0xFF4D0F29);
  static Color themeColor = Colors.green;
  static Color textColor = Colors.black87;
  static Color greyColor1 = Commons.colorFromHex('#f7f7f7');
  static Color greyColor2 =Commons.colorFromHex('#999999');
  static Color greyColor3 = Commons.colorFromHex('#333333');

  static Color colorFromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}