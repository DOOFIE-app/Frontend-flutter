import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/auth.dart';
import '../../repositories/session.dart';
import '../../utilities/commons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthProvider authProvider = AuthProvider();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), checkLoginStatus);
  }

  Future<void> checkLoginStatus() async {
    if (authProvider.auth.currentUser != null) {
      Provider.of<SessionProvider>(context, listen: false)
          .initiateSession(authProvider.auth.currentUser.uid);
      await Navigator.pushNamedAndRemoveUntil(
          context, '/dashboard', (_) => false);
    } else {
      await Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/bg.png'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Commons.bgColor, BlendMode.dstATop),
      )),
      alignment: Alignment.center,
      child: Container(
        width: 300,
        height: 400,
        alignment: Alignment.topCenter,
        child: Image(
          image: AssetImage('assets/images/logo.png'),
          color: Colors.white,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
