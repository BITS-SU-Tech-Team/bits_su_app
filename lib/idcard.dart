import 'package:flutter/material.dart';
import 'zoom_scaffold.dart';
import 'myapp_bar_dscreen.dart';
import 'food_items.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class IDCard extends StatefulWidget {
  @override
  _IDCardState createState() => _IDCardState();
}

class _IDCardState extends State<IDCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: PageView(
            controller: PageController(initialPage: 0),
children: <Widget>[


],
          ),
        ),
      ],
    );
  }
}
