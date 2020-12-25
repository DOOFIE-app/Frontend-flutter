import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utilities/commons.dart';
import 'package:restaurant_app/view/dashboard/dashboard.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
                height: 200,
                child: Image(image: AssetImage('assets/images/app_logo.PNG'))
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width*.8,
                height: 40,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                  border: Border.all(color: Commons.themeColor,width: .5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  textAlign: TextAlign.start,
                  cursorHeight: 20,
                  cursorWidth: .5,
                  cursorColor: Colors.green.withOpacity(.4),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Mail Id',
                      hintStyle: TextStyle(color:Commons.greyColor2)
                  ),
                  onChanged: null,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width*.8,
                height: 40,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                  border: Border.all(color:Commons.themeColor,width: .5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  textAlign: TextAlign.start,
                  cursorHeight: 20,
                  cursorWidth: .5,
                  cursorColor: Colors.green.withOpacity(.4),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Commons.greyColor2)
                  ),
                  onChanged: null,
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/dashboard');
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: MediaQuery.of(context).size.width*.8,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Commons.themeColor.withOpacity(.95),
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
            ),
          ],
        ),
      ),
    );
  }
}