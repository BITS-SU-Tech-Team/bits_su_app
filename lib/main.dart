import 'package:flutter/material.dart';
import 'signings.dart';
import 'BottomBar/curved_bottom_bar.dart';
import 'screens/charts.dart';
import 'listview.dart';
import 'screens/Login.dart';
import 'screens/Signings.dart';
import 'screens/event_details.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CurvedBottomBar()
        ));
  }
}
