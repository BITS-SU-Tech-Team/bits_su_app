import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
import 'charts.dart';
import 'package:flutter_circular_slider/flutter_circular_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SetLimits extends StatefulWidget {
  @override
  _SetLimitsState createState() => _SetLimitsState();
}

Color bg = Color(0xff08599B);
Color buttonbg = Color(0xffFCAD01);
Color signingsbg = Color(0xffEFF4F8);
Color text = Color(0xff377DB6);
var Limit = 10;
var limit = 1000;
var isselected = true;

class _SetLimitsState extends State<SetLimits> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xff1F1D2E),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  color: Color(0xff2E2F38),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Expenditure',
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.2,
                            fontSize: 28,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w900),
                      )),
                  Bezier(0xff2E2F38, 0xffFC726E, 0xffffffff),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                'Worried about spending too much? \n Set your limit here, and we will send you a notification if you get too greedy.',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffEEAA61),
                  fontFamily: 'CeraPro',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).size.height * 0.016,
                  0,
                  MediaQuery.of(context).size.height * 0.016),
              child: SingleCircularSlider(
                100,
                Limit,
                handlerOutterRadius: 1,
                sliderStrokeWidth: 3,
                baseColor: Color(0xff1F1D2E),
                child: Center(
                    child: Text(
                  '$limit',
                  style: TextStyle(
                      color: Color(0xffEEAA61),
                      fontSize: 24,
                      fontFamily: 'Monstserrat',
                      fontWeight: FontWeight.w500),
                )),
                onSelectionChange: _ChangeLimit,
                handlerColor: Color(0xffEEAA61),
                selectionColor: Color(0xffC35F72),
                height: MediaQuery.of(context).size.width * 0.30,
                width: MediaQuery.of(context).size.width * 0.30,
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xffC35F72),
                      Color(0xffEEAA61),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                width: 250,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: RaisedButton(
                    color: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        var limit = MediaQuery.of(context).size.height;
                        Fluttertoast.showToast(
                          msg: '$limit',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          textColor: Colors.black,
                          fontSize: 16,
                        );
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
    );
  }

  void _ChangeLimit(int a, int b, int c) {
    setState(() {
      Limit = b;
      limit = Limit * 100;
    });
  }
}
