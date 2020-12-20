import 'package:flutter/material.dart';
import 'package:restaurant_app/utilities/commons.dart';

final appTheme = ThemeData(
  primaryColor: Commons.themeColor,
  primarySwatch: Colors.indigo,
  unselectedWidgetColor: Colors.white,
  accentIconTheme: const IconThemeData(color: Colors.black),
  textTheme: const TextTheme(bodyText1: TextStyle(fontFamily: 'Helvetica')),
  iconTheme: IconThemeData(color: Commons.themeColor.withOpacity(.7)),
  fontFamily: 'Helvetica',
  hintColor: Commons.hintColor,
);