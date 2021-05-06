import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/view/menu/menu.dart';
import 'package:restaurant_app/view/order/orders-page.dart';
import 'package:restaurant_app/view/profile/profile.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[OrdersPage(), Menu(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        elevation: 5,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_rounded,
              color: Colors.grey,
            ),
            activeIcon: Icon(Icons.shopping_cart_rounded),
            title: Text(
              'Orders',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.menu_book_rounded,
              color: Colors.grey,
            ),
            activeIcon: Icon(Icons.menu_book_rounded),
            title: Text(
              'Menu',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.face_unlock_rounded,
              color: Colors.grey,
            ),
            activeIcon: Icon(Icons.face_unlock_rounded),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
