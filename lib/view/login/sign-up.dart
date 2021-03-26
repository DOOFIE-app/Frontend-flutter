import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/commons.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  _mailField(),
                  _passwordField(),
                  _registerButton(),
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
              hintStyle: TextStyle(color: Commons.greyAccent3)),
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
              hintStyle: TextStyle(color: Commons.greyAccent3)),
          onChanged: null,
        ),
      ),
    );
  }

  Widget _registerButton() {
    return GestureDetector(
      onTap: () async {
        //todo create user
        // await ApiClient.auth
        //     .createUserWithEmailAndPassword(
        //       email: 'test@doofie1.com'.trim(),
        //       password: 'password'.trim(),
        //     )
        //     .then((value) => print(
        //         '==============> Login details: ${value.user}, ${value.additionalUserInfo.username}'));
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
            'Register',
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
