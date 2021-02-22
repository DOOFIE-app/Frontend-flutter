import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//screens
import 'utilities/app-theme.dart';
import 'view/dashboard/dashboard.dart';
import 'view/login/login.dart';
import 'view/menu/menu.provider.dart';
import 'view/menu/menu_form.dart';
//providers
import 'view/menu/menu_form.validator.dart';
import 'view/order/completed-order.dart';
import 'view/order/completed-order.provider.dart';
import 'view/order/pending-order.provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PendingOrderProvider()),
        ChangeNotifierProvider(create: (context) => CompletedOrderProvider()),
        ChangeNotifierProvider(create: (context) => MenuFormValidator()),
        ChangeNotifierProvider(create: (context) => MenuProvider()),
      ],
      child: MaterialApp(
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
          routes: <String, WidgetBuilder>{
            '/home': (BuildContext context) => LoginPage(),
            '/dashboard': (BuildContext context) => Dashboard(),
            '/completed-orders': (BuildContext context) => CompletedOrder(),
            '/menu-form': (BuildContext context) => MenuForm(),
          }),
    );
  }
}
