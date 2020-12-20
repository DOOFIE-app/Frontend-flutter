import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utilities/app-theme.dart';
import 'package:restaurant_app/view/login/login.dart';
import 'package:restaurant_app/view/dashboard/dashboard.dart';
import 'package:restaurant_app/view/order/completed-order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: appTheme,
        home: LoginPage(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => LoginPage(),
          '/dashboard': (BuildContext context) => Dashboard(),
          '/completed-orders': (BuildContext context) => CompletedOrder(),
        }
    );
  }
}


