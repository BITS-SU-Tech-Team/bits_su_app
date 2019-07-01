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
              height: 220,
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
                              padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                              child: Image.asset('images/bitslogo.png',height: MediaQuery.of(context).size.height*0.10,))),
                      Container(

                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                           Column(
                             children: <Widget>[

                               Text('Birla Institute of Technology & Science,'
                                   ,style: TextStyle(
    fontSize: 14,
                                   fontWeight: FontWeight.w900
                                 ),),
                          Text('Pilani',style: TextStyle(
                              fontWeight: FontWeight.w900
                          ),),
                             ],
                           )

                         ,
                         SizedBox(
                           height: 5,
                         ),
                            Image.asset('images/image001.jpg',width: MediaQuery.of(context).size.width*0.60,height: 5,),
                            SizedBox(height: 10,),
                            Text.rich(TextSpan(
                              //  text: 'Name:  ',
                               // style: TextStyle(
                                //    fontSize: 24,
                                 //   fontWeight: FontWeight.bold,
                                  //  fontFamily: 'Rockwell'),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: username.toUpperCase(),
                                      style: TextStyle(

                                        fontFamily: 'Rockwell',
                                        fontSize: 16,fontWeight:FontWeight.w900
                                      ))
                                ])),
                            SizedBox(
                              height: 15,
                            ),
                            Text.rich(TextSpan(
                              text: 'ID No:',
                              style: TextStyle(

                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Rockwell',
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' 2018A7PS0274P'.toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Rockwell',
                                      fontSize: 18,
                                    ))
                              ]
                            )),
                            SizedBox(height: 10,),
                            Text.rich(TextSpan(
                                text: 'Hostel:  ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Rockwell'),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'GN 2135'.toUpperCase(),
                                      style: TextStyle(
fontWeight: FontWeight.w500,
                                        fontFamily: 'Rockwell',
                                        fontSize: 18,
                                      ))
                                ])),
                            SizedBox(
                              height: 15,
                            ),

                            SizedBox(height: 5,),
                            Image.asset('images/image001.jpg',width: MediaQuery.of(context).size.width*0.60,height: 5,),
                          ],
                        ),
                        margin: EdgeInsets.fromLTRB(5,10, 35, 0),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[

                      Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 10, 10),
                          child: Text(
                            'Valid till:July 2020',
                            style: TextStyle(fontWeight: FontWeight.w900),
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
