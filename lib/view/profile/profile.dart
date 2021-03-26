import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../repositories/session.dart';
import '../../utilities/commons.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  SessionProvider _sessionProvider;

  @override
  Widget build(BuildContext context) {
    _sessionProvider = Provider.of<SessionProvider>(context);

    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                color: Commons.bgColor,
              )),
          Positioned(
            top: 10,
            left: 20,
            child: Text(
              _sessionProvider.userSession.name?.toUpperCase() ?? '',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: Text(
              _sessionProvider.restaurantSession.name ?? '',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          // Positioned(
          //   top: 90,
          //   left: 20,
          //   child: Text(
          //     'Today total orders: 5',
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 15),
          //   ),
          // ),
          Positioned(
              top: 25,
              right: 20,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                alignment: Alignment.center,
                child: Text(
                  _sessionProvider.userSession.name
                          ?.substring(0, 1)
                          .toUpperCase() ??
                      '',
                  style: TextStyle(
                      color: Commons.bgColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              )),
          Positioned(
            top: 120,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.edit),
                    title: Text(
                      'Edit profile',
                      style: TextStyle(
                          color: Commons.bgColor, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                  _divider(),
                  ListTile(
                    leading: Icon(Icons.book_online),
                    title: Text(
                      'Orders',
                      style: TextStyle(
                          color: Commons.bgColor, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                  _divider(),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text(
                      'Notification settings',
                      style: TextStyle(
                          color: Commons.bgColor, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                  _divider(),
                  ListTile(
                    leading: Icon(Icons.face),
                    title: Text(
                      'Employees',
                      style: TextStyle(
                          color: Commons.bgColor, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                  _divider(),
                  ListTile(
                    leading: Icon(Icons.menu_book_rounded),
                    title: Text(
                      'Todays details',
                      style: TextStyle(
                          color: Commons.bgColor, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  ),
                  _divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(
      thickness: .5,
      color: Commons.greyAccent2,
      height: 0,
      indent: 10,
      endIndent: 10,
    );
  }
}
