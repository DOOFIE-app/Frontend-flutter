import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../utilities/commons.dart';
import 'menu_form.validator.dart';

class MenuForm extends StatefulWidget {
  @override
  _MenuFormState createState() => _MenuFormState();
}

class _MenuFormState extends State<MenuForm> {
  MenuFormValidator _menuFormValidator;
  File _image;

  @override
  Widget build(BuildContext context) {
    _menuFormValidator = Provider.of<MenuFormValidator>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Add menu item',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Commons.bgColor,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Commons.bgColor, BlendMode.dstATop),
            )),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              _pickImageField(),
              ListTile(
                leading: Icon(
                  Icons.fastfood_outlined,
                  color: Colors.white,
                ),
                title: Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: .5)),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Item name',
                      labelStyle: TextStyle(color: Commons.greyAccent2),
                      errorText: _menuFormValidator.itemName.error,
                    ),
                    onChanged: (String value) {
                      // menuFormValidator.changeName(value);
                    },
                  ),
                ),
              ),
              _categoryField(),
              ListTile(
                leading: Text(
                  '₹',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                title: Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: .5)),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Amount',
                      labelStyle: TextStyle(color: Commons.greyAccent2),
                      errorText: _menuFormValidator.price.error,
                    ),
                    onChanged: (String value) {
                      // menuFormValidator.changeName(value);
                    },
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.description_outlined,
                  color: Colors.white,
                ),
                title: Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: .5)),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Description',
                      labelStyle: TextStyle(color: Commons.greyAccent2),
                      errorText: _menuFormValidator.description.error,
                    ),
                    onChanged: (String value) {
                      // menuFormValidator.changeName(value);
                    },
                  ),
                ),
              ),
              _timeField(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(2)),
                    child: Text(
                      'Add item',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pickImageField() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: GestureDetector(
          onTap: () {
            _showPicker(context);
          },
          child: CircleAvatar(
            radius: 55,
            backgroundColor: Commons.bgColor,
            child: _image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      _image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50)),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.grey[800],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _categoryField() {
    return ListTile(
      leading: Icon(
        Icons.category_outlined,
        color: Colors.white,
      ),
      title: DropdownButton<String>(
        focusColor: Colors.white,
        value: _menuFormValidator.category.value,
        style: TextStyle(color: Colors.white, fontSize: 16),
        onChanged: (String value) => _menuFormValidator.changeCategory(value),
        hint: Text(
          'Category',
          textAlign: TextAlign.center,
          style: TextStyle(color: Commons.greyAccent2),
        ),
        items: [
          'Starters',
          'Main course',
          'Break fast',
          'Fast foods',
          'Drinks',
          'Any'
        ].map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              '$item',
              style: TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _timeField() {
    return ListTile(
      leading: Icon(
        Icons.timelapse_outlined,
        color: Colors.white,
      ),
      title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: _menuFormValidator.startTime.value,
              style: TextStyle(color: Colors.white, fontSize: 16),
              onChanged: (String value) =>
                  _menuFormValidator.changeStartTime(value),
              hint: Text(
                'Available from',
                textAlign: TextAlign.center,
                style: TextStyle(color: Commons.greyAccent2),
              ),
              items: _menuFormValidator.timeList.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    '$item',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: _menuFormValidator.endTime.value,
              style: TextStyle(color: Colors.white, fontSize: 16),
              onChanged: (String value) =>
                  _menuFormValidator.changeEndTime(value),
              hint: Text(
                'Available till',
                textAlign: TextAlign.center,
                style: TextStyle(color: Commons.greyAccent2),
              ),
              items: _menuFormValidator.timeList.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    '$item',
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            )
          ]),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromCamera() async {
    final File image = await ImagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
        maxHeight: 200,
        maxWidth: 200);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    final File image = await ImagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
        maxHeight: 200,
        maxWidth: 200);

    setState(() {
      _image = image;
    });
  }
}
