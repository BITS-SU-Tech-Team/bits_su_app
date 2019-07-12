import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'screens/charts.dart';
import 'package:bits_su_app/listview.dart';

class SigningsPage extends StatefulWidget {
  @override
  _SigningsPageState createState() => _SigningsPageState();
}

class _SigningsPageState extends State<SigningsPage> {
  @override
  void initState() {
    super.initState();
  }

  Color bg = Color(0xff08599B);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: Color(0xffF7F7F7),
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                height: 180,
              decoration: BoxDecoration(gradient: LinearGradient(colors: [
                Color(0xffC35F72),
                Color(0xffEEAA61),

              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Text(
                        'Total Expenses',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                      top: 20,
                      left: 10,
                    ),
                    Positioned(
                      child: Text(
                        'Rs 4500',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      left: 10,
                      top: 45,
                    ),
                    Positioned(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/mypic.jpg'),
                        radius: 25,
                      ),
                      right: 10,
                      top: 20,
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Bezier(0xff2E2F38, 0xffC35F72, 0xffffffff),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 70,
                          child: RaisedButton(
                              onPressed: () {
                                print('hello');
                              },
                              color: Colors.white,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.shopping_cart,
                                    color: bg,
                                  ),
                                  Text(
                                    'Signings',
                                    style: TextStyle(
                                        color: bg,
                                        fontSize: 20,
                                        fontFamily: 'Rockwell',
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)))),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 150,
                          height: 70,
                          child: RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              print('hello');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Icon(
                                  Icons.audiotrack,
                                  color: bg,
                                ),
                                Text(
                                  'Events',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'Rockwell',
                                      color: bg),
                                ),
                              ],
                            ),
                            shape: new RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                  ],
                ),
                top: 100,

              ),
             Container(
               margin: EdgeInsets.fromLTRB(0, 420, 0, 0),
               child: List(),
             )
            ],
          )),
    );
  }
}
