import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utilities/commons.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Commons.bgColor, BlendMode.dstATop),
              )),
            ),
            Container(
              height: 400,
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 100,
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                  ),
                  _mailField(),
                  _passwordField(),
                  _loginButton(),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'don\'t have an account? ',
                          style: TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _mailField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: 40,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Commons.bgColor, width: .5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextField(
          textAlign: TextAlign.start,
          cursorHeight: 20,
          cursorWidth: .5,
          cursorColor: Commons.bgColor,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Mail Id',
              hintStyle: TextStyle(color: Commons.greyColor2)),
          onChanged: null,
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: 40,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          border: Border.all(color: Commons.bgColor, width: .5),
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextField(
          textAlign: TextAlign.start,
          cursorHeight: 20,
          cursorWidth: .5,
          cursorColor: Colors.green.withOpacity(.4),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
              hintStyle: TextStyle(color: Commons.greyColor2)),
          onChanged: null,
        ),
      ),
    );
  }

  Widget _loginButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/dashboard');
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: MediaQuery.of(context).size.width * .8,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.green,
          ),
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
