import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../utilities/commons.dart';
import 'menu-form.validator.dart';

class MenuForm extends StatefulWidget {
  final String serviceId;
  final String serviceName;
  final String description;
  final String timing;
  final String price;
  final String serviceImage;
  String categoryId;

  MenuForm(
      {Key key,
      this.serviceId,
      this.serviceName,
      this.description,
      this.timing,
      this.price,
      this.serviceImage,
      this.categoryId})
      : super(key: key);

  @override
  _MenuFormState createState() => _MenuFormState();
}

class _MenuFormState extends State<MenuForm> {
  FocusNode myFocusNode;
  String _serviceId;
  String _serviceName;
  String _description;
  String _timing;
  String _price;
  String _serviceImage;
  String _categoryId;
  num time;
  MenuFormValidator menuFormValidator;
  String _mySelection;

  bool newCategory = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _controllerName;
  TextEditingController _controllerDescription;
  TextEditingController _controllerPrice;
  TextEditingController _controllerImage;
  num exampleArgument = 2;

  _MenuFormState();

  @override
  void initState() {
    super.initState();
    _serviceId = widget.serviceId;
    _serviceName = widget.serviceName;
    _description = widget.description;
    _timing = widget.timing;
    _price = widget.price;
    _serviceImage = widget.serviceImage;
    _categoryId = widget.categoryId;

    if (_serviceId != null) {
      final price = _price.replaceAll(RegExp('₹'), '');

      _controllerName = TextEditingController(text: _serviceName);
      _controllerDescription = TextEditingController(text: _description);
      _controllerPrice = TextEditingController(text: price);
      _controllerImage = TextEditingController(text: _serviceImage);

      _mySelection = _categoryId;
    }

    // WidgetsBinding.instance.addPostFrameCallback((_) =>
    //     Provider.of<ServiceFormValidator>(context, listen: false)
    //         .fetchCategory());

    if (_serviceId != null) {
      time = num.parse(_timing.replaceAll(RegExp(' mins'), ''));

      WidgetsBinding.instance.addPostFrameCallback((_) =>
          Provider.of<MenuFormValidator>(context, listen: false)
              .convertHrs(time));
    }
  }

  @override
  Widget build(BuildContext context) {
    menuFormValidator = Provider.of<MenuFormValidator>(context);

    return Consumer<MenuFormValidator>(
        builder: (BuildContext context, MenuFormValidator serviceForm, _) {
      if (serviceForm.isLoading == true) {
        return Commons.loader();
      } else {
        return showForm(serviceForm);
      }
    });
  }

  Widget showForm(MenuFormValidator serviceForm) {
    return Scaffold(
        body: InkWell(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
      },
      child: ListView(
        children: <Widget>[
          // Container(color: Commons.greyAccent1, child: AppHeader()),
          ListTile(
              title: Container(
                  child: _serviceId == null
                      ? Text(
                          'Add service',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Commons.sbColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          'Edit service',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Commons.sbColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
          ListTile(
            title: InkWell(
              onTap: () {
                _showPicker(context);
              },
              child: _controllerImage == null
                  ? CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.black12,
                      child: menuFormValidator.image.value != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                menuFormValidator.image.value,
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
                                Icons.camera_alt,
                                color: Colors.grey[800],
                              ),
                            ),
                    )
                  : CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.black12,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          _serviceImage,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
            ),
          ),
          ListTile(
            // leading:
            //     Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //   Image.asset('assets/images/services.png', width: 23, height: 23),
            // ]), //
            title: _controllerName == null
                ? TextField(
                    decoration: InputDecoration(
                      hintText: 'Service Name',
                      hintStyle: TextStyle(color: Commons.greyAccent2),
                      errorText: menuFormValidator.serviceName.error,
                    ),
                    onChanged: (String value) {
                      menuFormValidator.changeName(value);
                    },
                  )
                : TextFormField(
                    controller: _controllerName,
                    decoration: InputDecoration(
                      hintText: 'Service Name',
                      hintStyle: TextStyle(color: Commons.greyAccent2),
                      errorText: menuFormValidator.serviceName.error,
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _serviceName = value;
                      });
                    },
                  ),
          ),
          ListTile(
            // leading:
            //     Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //   Image.asset('assets/images/category.png', width: 23, height: 23),
            // ]),
            title: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                  hint: Text(
                    'Category',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Commons.greyAccent2),
                  ),
                  items: serviceForm.categoryList?.map((item) {
                        return DropdownMenuItem<String>(
                          value: item.id.toString(),
                          child: Text(item.name),
                        );
                      })?.toList() ??
                      [],
                  onChanged: (String newValue) {
                    setState(() {
                      _mySelection = newValue;

                      if (_mySelection == '0') {
                        newCategory = true;
                      } else {
                        newCategory = false;
                        menuFormValidator.category.value = newValue;
                      }
                      ;
                    });
                  },
                  value: _mySelection,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Builder(
                    builder: (context) {
                      if (newCategory == true) {
                        return TextFormField(
                          decoration: InputDecoration(
                            hintText: 'New Category',
                            hintStyle: TextStyle(color: Commons.greyAccent2),
                            errorText: menuFormValidator.newcategory.error,
                          ),
                          onChanged: (String value) {
                            menuFormValidator.changeNewCategory(value);
                          },
                        );
                      } else {
                        return Container(color: Colors.white // This is optional
                            );
                      }
                    },
                  ))
            ]),
          ),
          ListTile(
              // leading: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Image.asset('assets/images/description.png',
              //           width: 23, height: 23),
              //     ]), //
              title: _controllerDescription == null
                  ? TextField(
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: TextStyle(color: Commons.greyAccent2),
                        errorText: menuFormValidator.description.error,
                      ),
                      onChanged: (String value) {
                        menuFormValidator.changeDescription(value);
                      },
                    )
                  : TextField(
                      controller: _controllerDescription,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        hintStyle: TextStyle(color: Commons.greyAccent2),
                        errorText: menuFormValidator.description.error,
                      ),
                      onChanged: (String value) {
                        menuFormValidator
                            .changeDescription(_controllerDescription.text);
                      },
                    )),
          ListTile(
              // leading: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Image.asset('assets/images/gender.png',
              //           width: 23, height: 23),
              //     ]),
              title: DropdownButton<String>(
            value: menuFormValidator.gender.getValue,
            onChanged: (String value) => menuFormValidator.changeGender(value),
            hint: Text(
              'Gender',
              textAlign: TextAlign.center,
              style: TextStyle(color: Commons.greyAccent2),
            ),
            items: ['Male', 'Female'].map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text('$item'),
              );
            }).toList(),
          )),
          ListTile(
            // leading:
            //     Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //   Image.asset('assets/images/price.png', width: 23, height: 23),
            // ]), //
            title: _controllerPrice == null
                ? TextField(
                    decoration: InputDecoration(
                      hintText: 'Price',
                      hintStyle: TextStyle(color: Commons.greyAccent2),
                      errorText: menuFormValidator.price.error,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      menuFormValidator.changePrice(value);
                    },
                  )
                : TextField(
                    controller: _controllerPrice,
                    decoration: InputDecoration(
                      hintText: 'Price',
                      hintStyle: TextStyle(color: Commons.greyAccent2),
                      errorText: menuFormValidator.price.error,
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      _price = value;
                    },
                  ),
          ),
          ListTile(
            // leading:
            //     Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //   Image.asset('assets/images/time-taken.png',
            //       width: 23, height: 23),
            // ]), //
            title: Row(children: [
              DropdownButton<String>(
                value: menuFormValidator.hours.value,
                onChanged: (String value) =>
                    menuFormValidator.changeHours(value),
                hint: Text(
                  'Hours',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Commons.greyAccent2),
                ),
                items: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map((item) {
                  return DropdownMenuItem<String>(
                    value: item.toString(),
                    child: Text('$item'),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                value: menuFormValidator.minutes.value,
                onChanged: (String value) =>
                    menuFormValidator.changeMinutes(value),
                hint: Text(
                  'Minutes',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Commons.greyAccent2),
                ),
                items: [10, 15, 20, 25, 30, 35, 40, 45, 49, 50, 55].map((item) {
                  return DropdownMenuItem<String>(
                    value: item.toString(),
                    child: Text('$item'),
                  );
                }).toList(),
              )
            ]),
          ),
          Container(
              padding: const EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                _serviceId == null
                    ? RaisedButton(
                        color: Commons.sbColor,
                        splashColor: Colors.blue,
                        onPressed: !menuFormValidator.isLoading &&
                                menuFormValidator.isValid
                            ? () async {
                                await menuFormValidator.submitData().then(
                                    (value) => {
                                          menuFormValidator.clearForm(),
                                          Navigator.pop(context)
                                        });
                              }
                            : null,
                        textColor: menuFormValidator.isLoading
                            ? Colors.black
                            : Colors.white,
                        child: const Text('Submit'),
                      )
                    : RaisedButton(
                        color: Commons.sbColor,
                        splashColor: Colors.blue,
                        onPressed: !menuFormValidator.isLoading
                            ? () async {
                                await menuFormValidator
                                    .updateService(
                                        _serviceId,
                                        _controllerName.text,
                                        _controllerDescription.text,
                                        _mySelection,
                                        _controllerPrice.text,
                                        time,
                                        _serviceImage)
                                    .then((value) => {
                                          menuFormValidator.clearForm(),
                                          Navigator.pop(context)
                                        });
                              }
                            : null,
                        textColor: menuFormValidator.isLoading
                            ? Colors.black
                            : Colors.white,
                        child: const Text('Update'),
                      )
              ]))
        ],
      ),
    ));
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
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
    final image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    // serviceFormValidator.changeImage(image);

    _controllerImage = null;
  }

  _imgFromGallery() async {
    final image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    // serviceFormValidator.changeImage(image);

    _controllerImage = null;
  }
}
