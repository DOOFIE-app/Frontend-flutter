import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/auth.dart';
import '../../repositories/session.dart';
import '../../utilities/app-text-field.dart';
import '../../utilities/commons.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthProvider authProvider;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: (authProvider.status == Status.Authenticating)
          ? _loader()
          : Center(
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
                              GestureDetector(
                                //todo navigate to sign-up page
                                // onTap: () => Navigator.pushNamed(context, '/sign-up'),
                                onTap: null,
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
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

  Widget _loader() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/bg.png'),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Commons.bgColor, BlendMode.dstATop),
      )),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _mailField() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4)),
          child: AppTextField(
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              textEditingController: _emailController,
              hint: 'Email',
              validator: (String value) {
                const pattern =
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                if (!RegExp(pattern).hasMatch(value)) {
                  return 'Please enter valid email';
                }
                return null;
              })),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: AppTextField(
              icon: Icons.security_rounded,
              textEditingController: _passwordController,
              hint: 'Password',
              obscureText: true,
              validator: (String value) {
                if (value.length < 5) {
                  return 'Please strength password';
                }
                return null;
              })),
    );
  }

  Widget _loginButton() {
    return GestureDetector(
      onTap: () async {
        SessionProvider sessionProvider = SessionProvider();
        try {
          await authProvider.signIn(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
          Navigator.pushReplacementNamed(context, '/dashboard');
        } on FirebaseAuthException catch (e) {
          authProvider.changeStatus(Status.Unauthenticated);
          if (e.code == 'user-not-found') {
            print('================> User not found <===================');
          } else if (e.code == 'wrong-password') {
            print('================> Wrong password <===================');
          } else {
            print('============> ${e.code} <============');
          }
        }
        // authProvider.userService.getUserById('zzFnmVCDQXP2h8zvorhGMd12nCy1');
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
