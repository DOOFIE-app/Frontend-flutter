import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utilities/commons.dart';

class PendingOrder extends StatefulWidget {
  PendingOrder({Key key}) : super(key: key);
  @override
  _PendingOrder createState() => _PendingOrder();
}
class _PendingOrder extends State<PendingOrder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder:(BuildContext context, int index){
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.fromLTRB(10,5,10,5),
              color: Commons.themeColor.withOpacity(.1),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2-50,
                        padding: EdgeInsets.only(right: 3),
                        child: Column(
                          children: [
                            Text('Address',
                              style: TextStyle(
                                  color: Commons.textColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('136, Periyar street, chennai - 600001,tamilnadu',
                              style: TextStyle(
                                  color: Commons.textColor,
                                  fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/2+10,
                        padding: EdgeInsets.only(left: 3),
                        decoration: BoxDecoration(
                            border: Border(left:BorderSide(
                                width: .5
                            ))
                        ),
                        child: Column(
                          children: [
                            Text('Orders',
                              style: TextStyle(
                                color: Commons.textColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder:(BuildContext context, int index){
                                  return
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width/2-60,
                                          child: Text('${index+1}. Tandoori Chicken',
                                            style: TextStyle(
                                              color: Commons.textColor,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:60,
                                          color: Colors.white,
                                          child: Text(' (count: 2)',
                                            style: TextStyle(
                                              color: Commons.textColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                }
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Divider(
                    indent: 10,
                    endIndent: 10,
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 70,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border(),
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Text(
                          'Accept',
                          style:  TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                        width: 160,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border(),
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Text(
                          'Packed & dispatched',
                          style:  TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Container(
                          width: 70,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border(),
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: Icon(Icons.call,
                            color: Colors.white,)
                      ),
                      Container(
                        width: 70,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border(),
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Text(
                          'Reject',

                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ),
          );
        }
    );
  }
}
