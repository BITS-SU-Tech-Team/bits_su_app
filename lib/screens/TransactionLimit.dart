import 'package:flutter/material.dart';

import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Expenditure extends StatefulWidget {
  @override
  _ExpenditureState createState() => _ExpenditureState();
}

Color bg = Color(0xff08599B);
Color buttonbg = Color(0xffFCAD01);
Color signingsbg = Color(0xffEFF4F8);
Color text = Color(0xff377DB6);
var Limit = 10;
var limit = 1000;

class _ExpenditureState extends State<Expenditure> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Container(

          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,colors: [ Colors.indigo[800],
                Colors.indigo[700],
                Colors.indigo[600],
                Colors.indigo[400],])
          ),
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 60, 0, 20),
                  child: Text(
                    'Expenditure Cap',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Rockwell'),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child:Text("Set your Monthly Expenditure Limits here and if it exceeds that, We'll give you a warning.",style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                  textAlign: TextAlign.center,),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: SingleCircularSlider(

                    100,
                    Limit,
                    baseColor: buttonbg,
                    child: Center(
                        child: Text(
                          '$limit',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'CeraPro',
                              fontWeight: FontWeight.bold),
                        )),
                    onSelectionChange: _ChangeLimit,
                    handlerColor: Colors.red,
                    selectionColor: Colors.red,
                  height: MediaQuery.of(context).size.height*0.4,
                    width: MediaQuery.of(context).size.width*0.4,
                  ),
                ),
              ),

              Container(
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.003, 0, 0),
                  width: 250,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: RaisedButton(
                      color: buttonbg,
                      onPressed: () {
                        setState(() {
                          Fluttertoast.showToast(msg: 'limits set',toastLength: Toast.LENGTH_LONG,gravity: ToastGravity.BOTTOM,textColor: Colors.black,fontSize: 16,)
                          ;
                        });
                      },
                      child: Text(
                        'Set Limit',
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

  void _ChangeLimit(int a, int b, int c) {
    setState(() {
      Limit = b;
      limit = Limit * 100;
    });
  }

  @override
  void initState() {
    super.initState();
  }
}
