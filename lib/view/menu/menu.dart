import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/utilities/commons.dart';
import 'package:rxdart/rxdart.dart';

import 'menu.provider.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);
  @override
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  MenuProvider _menuProvider;
  StreamSubscription<Event> _streamSubscription;
  String id;

  @override
  void initState() {
    super.initState();
    id = _auth.currentUser.uid;
    MenuProvider menuProvider =
        Provider.of<MenuProvider>(context, listen: false);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => menuProvider.getFoodList(id));
    _streamSubscription = Commons.events
        .debounceTime(const Duration(milliseconds: 300))
        .where((event) => event.name == RELOAD_MENU)
        .listen((event) {
      menuProvider.getFoodList(id);
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _menuProvider = Provider.of<MenuProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: _addItemButton(),
        // Text('Menu'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 100,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _menuProvider.categoryList.length,
            itemBuilder: (context, index) {
              String category = _menuProvider.categoryList[index];
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      category.toUpperCase(),
                      style: TextStyle(
                        color: Commons.bgColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _menuProvider.foodList.length,
                      itemBuilder: (context, itemIndex) => (_menuProvider
                                  .foodList[itemIndex].category ==
                              category)
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 140,
                                ),
                                Positioned(
                                  top: 35,
                                  left: 20,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.center_focus_strong_sharp,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                      Text(
                                        ' ${_menuProvider.foodList[itemIndex].name}',
                                        style: TextStyle(
                                          color: Commons.bgColor,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 55,
                                  left: 45,
                                  child: Text(
                                    '₹${_menuProvider.foodList[itemIndex].amount}',
                                    style: TextStyle(
                                        color: Commons.bgColor,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Positioned(
                                  top: 85,
                                  left: 20,
                                  child: GestureDetector(
                                    onTap: () {
                                      showAlert(context,
                                          id: id,
                                          name: _menuProvider
                                              .foodList[itemIndex].name,
                                          price: _menuProvider
                                              .foodList[itemIndex].amount,
                                          status: _menuProvider
                                              .foodList[itemIndex].status,
                                          category: _menuProvider
                                              .foodList[itemIndex].category,
                                          startTime: _menuProvider
                                              .foodList[itemIndex].startTime,
                                          endTime: _menuProvider
                                              .foodList[itemIndex].endTime);
                                    },
                                    child: Container(
                                      color: Colors.grey,
                                      padding: EdgeInsets.all(5),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.delete_forever_outlined,
                                            size: 25,
                                          ),
                                          Text(
                                            'Delete item',
                                            style: TextStyle(
                                                // color: Colors.red,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    right: 20,
                                    child: (_menuProvider.foodList[itemIndex]
                                                    .image !=
                                                null &&
                                            _menuProvider.foodList[itemIndex]
                                                    .image !=
                                                '')
                                        ? Image.network(
                                            _menuProvider
                                                .foodList[itemIndex].image,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            'assets/images/placeholder.png',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          )),
                                Positioned(
                                    bottom: 0,
                                    right: 10,
                                    left: 10,
                                    child: Divider(
                                      thickness: 1,
                                    )),
                              ],
                            )
                          : Container()),
                ],
              );
            }),
      ),
    );
  }

  Widget _addItemButton() {
    return GestureDetector(
      onTap: () async {
        await Navigator.pushNamed(context, '/menu-form');
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: Commons.greyAccent3, width: .7),
            borderRadius: BorderRadius.circular(4)),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle,
              size: 35,
              color: Colors.green,
            ),
            Text(
              'Add food to menu',
              style: TextStyle(
                color: Commons.bgColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlert(BuildContext context,
      {String id,
      String name,
      num price,
      String category,
      String startTime,
      String endTime,
      bool status}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ButtonBarTheme(
          data: const ButtonBarThemeData(alignment: MainAxisAlignment.center),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            title: Icon(
              Icons.delete_forever_outlined,
              size: 50,
            ),
            content: const Text(
              'Are you sure, do you want to delete this item?',
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: RaisedButton(
                      onPressed: () async {
                        await _menuProvider.deleteItem(
                            id: id,
                            name: name,
                            price: price,
                            status: status,
                            category: category,
                            startTime: startTime,
                            endTime: endTime);
                        // await _appointmentRepository.appointmentStatusUpdate(id, 'cancelled');
                        // await reloadList();
                        Navigator.of(context).pop();
                      },
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
