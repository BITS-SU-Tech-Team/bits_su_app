import 'package:flutter/material.dart';
import 'info_screen.dart';
import 'package:bits_su_app/myapp_bar.dart';
import 'package:bits_su_app/detailpage.dart';
import 'package:bits_su_app/profile_screen.dart';
import 'BlockCard.dart';
import 'TransactionLimit.dart';

class ViewPager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: Container(
            child: PageView(
          children: <Widget>[
            MyCustomAppBar(
              appBarSize: 150,
              divheight: 20,
              divwidth: 20,
            ),
            Expenditure(),
            DisableCard(),
          ],
          controller: PageController(initialPage: 1, ),
        )),
      ),
    );
  }
}
