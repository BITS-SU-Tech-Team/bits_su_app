import 'package:flutter/material.dart';


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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bg,
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(10, 60, 10, 20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Image.asset('assets/bitslogo.png'))),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text.rich(TextSpan(
                                text: 'Name:  ',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Rockwell'),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: username,
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'Rockwell',
                                        fontSize: 20,
                                      ))
                                ])),
                            SizedBox(
                              height: 5,
                            ),
                            Text.rich(TextSpan(
                                text: 'Bhawan:  ',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Rockwell'),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Shankar',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'Rockwell',
                                        fontSize: 20,
                                      ))
                                ])),
                            SizedBox(
                              height: 5,
                            ),
                            Text.rich(TextSpan(
                                text: 'DoB:  ',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto'
                                        ''),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '14/10/2000',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'Rockwell',
                                        fontSize: 20,
                                      ))
                                ])),
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 0, 10),
                          child: Text(
                            'ID: 2018A7PS0274P',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          )),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 10, 10),
                          child: Text(
                            'Valid till:July 2020',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 80, 0, 0),
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
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
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
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
    );
  }

  void printbutton(int value) {
    setState(() {
      _value = value;
    });
  }
}
