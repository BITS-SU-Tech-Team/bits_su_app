import 'package:flutter/material.dart';

import 'package:bits_su_app/IDCardDesign.dart';
Color bg = Color(0xff08599B);
Color buttonbg = Color(0xffFCAD01);
var _value = -1;

class DisableCard extends StatefulWidget {
  @override
  _DisableCardState createState() => _DisableCardState();
}

var username = 'Ayush Singh';
void main() {
  runApp(DisableCard());
}

class _DisableCardState extends State<DisableCard> {
  @override
  Widget build(BuildContext context) {
   var maxheight=MediaQuery.of(context).size.height;
   print('$maxheight');
   return MaterialApp(
      home: Scaffold(
        backgroundColor: bg,
        body: SingleChildScrollView(

          child: Column(
            children: <Widget>[
             IDcard(),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                      child: Row(
                        children: <Widget>[
                          Radio(
                            groupValue: _value,
                            value: 0,
                            onChanged: printbutton,
                            activeColor: buttonbg,
                          ),
                          Text(
                            'ID Card broke',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'CeraPro',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                      child: Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _value,
                            onChanged: printbutton,
                            activeColor: buttonbg,
                          ),
                          Text(
                            'ID Card Lost',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'CeraPro',
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
                      child: Row(
                        children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: _value,
                            onChanged: printbutton,
                            activeColor: buttonbg,
                          ),
                          Text(
                            'Other',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'CeraPro',
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, maxheight*0.02, 0, 10),
                  width: 250,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: RaisedButton(
                      color: buttonbg,
                      onPressed: () {
                        print('hello');
                      },
                      child: Text(
                        'Block Card',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'CeraPro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textColor: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void printbutton(int value) {
    setState(() {
      _value = value;
    });
  }
}
