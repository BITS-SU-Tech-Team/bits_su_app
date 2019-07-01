import 'package:flutter/material.dart';
import 'MenuTabBar.dart';
import 'package:bits_su_app/screens/BlockCard.dart';
import 'package:bits_su_app/screens/TransactionLimit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomBar extends StatefulWidget {
  int _page;
  Function(int) callback;
  BottomBar(this._page, this.callback);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return MenuTabBar(
      background: Colors.blue,
      iconButtons: [
        new IconButton(
          color: Colors.blue,
          icon: new Icon(Icons.home, size: 30),
          onPressed: () {
            setState(() {
              widget.callback(0);
            });
          },
        ),
        new IconButton(
            color: Colors.blue,
            icon: new Icon(Icons.search, size: 30),
            onPressed: () {
              setState(() {
                widget.callback(1);
              });
            }),
        new IconButton(
            color: Colors.blue,
            icon: new Icon(Icons.map, size: 30),
            onPressed: () {
              setState(() {
                widget.callback(2);
              });
            }),
        new IconButton(
            color: Colors.blue,
            icon: new Icon(Icons.favorite, size: 30),
            onPressed: () {
              setState(() {
                widget.callback(3);
              });
            }),
      ],
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Fluttertoast.showToast(
                        msg: 'ayush',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        textColor: Colors.black,
                        fontSize: 16,
                      );
                    });
                  },
                  child: new Text("Reminder",
                      style: TextStyle(color: Colors.white, fontSize: 20))),
              margin: EdgeInsets.all(10),
            ),
            new Container(
                child: new Text("Camera",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                margin: EdgeInsets.all(10)),
            new Container(
                child: new Text("Attchment",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                margin: EdgeInsets.all(10)),
            new Container(
                child: new Text("Text Note",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                margin: EdgeInsets.all(10))
          ]),
    );
  }
}
