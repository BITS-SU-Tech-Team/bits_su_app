import 'package:flutter/material.dart';
import 'package:bits_su_app/screens/info_screen.dart';
import 'package:bits_su_app/screens/disableId_screen.dart';
import 'package:bits_su_app/screens/pageview.dart';
void main() => runApp(ViewPager());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewPager(),
    );
  }
}
