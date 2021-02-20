import 'package:flutter/material.dart';
import 'package:restaurant_app/utilities/commons.dart';

final appTheme = ThemeData(
  primaryColor: Commons.sbColor,
  primarySwatch: Colors.indigo,
  unselectedWidgetColor: Colors.white,
  accentIconTheme: IconThemeData(color: Commons.textColor),
  textTheme: const TextTheme(bodyText1: TextStyle(fontFamily: 'Helvetica')),
  iconTheme: IconThemeData(color: Commons.sbColor),
  fontFamily: 'Helvetica',
  hintColor: Commons.hintColor,
);
