import 'package:flutter/material.dart';
import 'package:bits_su_app/screens/info_screen.dart';
import 'package:bits_su_app/screens/disableId_screen.dart';
import 'package:bits_su_app/screens/updated_profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
