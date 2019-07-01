import 'package:flutter/material.dart';
import 'MenuTabBar.dart';
import 'package:bits_su_app/main.dart';
import 'package:bits_su_app/screens/BlockCard.dart';
import 'package:bits_su_app/screens/TransactionLimit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'BottomBar.dart';
import 'package:bits_su_app/screens/Login.dart';
import 'package:bits_su_app/screens/updated_profile_page.dart';
import 'package:bits_su_app/screens/Signings.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}
final _pageoptions = [
  Expenditure(),
  DisableCard(),
  MyHomePage(),
  LoginPage(),
 Signings() ,
];
int _page=0;

class _HomeState extends State<Home> {

  callback(page){
    setState(() {
      _page=page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCAD01),
        body: new SafeArea(child: new Stack(children: <Widget>[
         Container(
height: MediaQuery.of(context).size.height*0.888,
         child:  _pageoptions[_page],
         ),
          new BottomBar(_page,callback)
        ]))
    );
  }
}
