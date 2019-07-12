import 'package:flutter/material.dart';
import 'zoom_scaffold.dart';
import 'myapp_bar_dscreen.dart';
import 'screens/BlockCard.dart';
import 'screens/TransactionLimit.dart';
import 'updated_ers_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'food_items.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class IDCard extends StatefulWidget {
  @override
  _IDCardState createState() => _IDCardState();
}

class _IDCardState extends State<IDCard> {
  int currentpage;

  @override
  void initState() {
    currentpage=1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          child: PageView(
            controller:PageController(initialPage: 1),
children: <Widget>[
DisableCard(),
  Expenditure(),
  IDCardPage(),
],
          onPageChanged: (value){
          setState(() {
            currentpage=value;
          });
          },),
        ),

         Container(
           margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
           child: Align(
             
             alignment: Alignment.bottomCenter,
             child: DotsIndicator(
              dotsCount: 3,
              position: currentpage,
              decorator: DotsDecorator(
                activeColor: Colors.yellow,

                size: const Size.square(9.0),
                activeSize: const Size(20.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
        ),
           ),
         )
      ],
    );
  }
}
