import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:bits_su_app/screens/TransactionLimit.dart';
import 'package:bits_su_app/screens/Signings.dart';
import 'package:bits_su_app/screens/BlockCard.dart';
import 'package:bits_su_app/updated_ers_page.dart';
import 'package:bits_su_app/screens/updated_profile_page.dart';
class CurvedBottomBar extends StatefulWidget {
  @override
  _CurvedBottomBarState createState() => _CurvedBottomBarState();
}

class _CurvedBottomBarState extends State<CurvedBottomBar> {
  int _page = 0;
  final _pageoptions = [
    Expenditure(),
    DisableCard(),
    MyHomePage(),
    IDCardPage(),
    Signings() ,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(
            Icons.add,
            size: 30,
          ),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
          Icon(Icons.call_split, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pageoptions[_page],
    );
  }
}
