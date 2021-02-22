import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/utilities/commons.dart';

import 'menu.provider.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);
  @override
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {
  MenuProvider _menuProvider;

  @override
  void initState() {
    super.initState();
    MenuProvider menuProvider =
        Provider.of<MenuProvider>(context, listen: false);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => menuProvider.getFoodList());
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
      body: Stack(
        children: [
          Positioned(
              top: 0,
              child: Container(
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
                            padding: EdgeInsets.all(5),
                            color: Commons.bgColor,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              category,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _menuProvider.foodList.length,
                              itemBuilder: (context, itemIndex) =>
                                  (_menuProvider.foodList[itemIndex]
                                              .categoryName ==
                                          category)
                                      ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: 50,
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              _menuProvider
                                                  .foodList[itemIndex].name,
                                              style: TextStyle(
                                                color: Commons.bgColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                      )
                                      : Container(
                                          height: 0,
                                        )),
                        ],
                      );
                    }),
              )),
        ],
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
}