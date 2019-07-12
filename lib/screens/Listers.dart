import 'package:flutter/material.dart';

class List extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx, i) {
      var borderSide =
      BorderSide(width: 1, color: Color(0xFFE3ECF2));
      var emptySide = BorderSide(style: BorderStyle.none);
      return Container(
        decoration: BoxDecoration(
          border: Border(
            top: i == 0 ? borderSide : emptySide,
            bottom: borderSide,
          ),
        ),
        child: ListTile(
          leading: Container(
            width: 50,
            height: double.infinity,
            child: Padding(padding: const EdgeInsets.only(right: 8.0),child: InkWell(
              onTap:(){
                setState(() {

                });
              },
            child: Container(
              child: Image.asset('images/su.png'),
              decoration: BoxDecoration(shape: BoxShape.circle,
              color: Colors.white),
            ),),),

          ),
        ),
      );

    });
  }
}
