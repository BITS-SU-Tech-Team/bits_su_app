import 'package:flutter/material.dart';

class MyCustomAppBarDScreen extends StatelessWidget {
  const MyCustomAppBarDScreen({
    Key key,
    @required this.divheight,
    @required this.divwidth,
    @required this.appBarSize,
    @required this.ontap,
  }) : super(key: key);

  final double divheight;
  final double divwidth;
  final double appBarSize;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2D5DA3), Color(0xFF254F88)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 20.0,
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      height: appBarSize,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Padding(
              padding: EdgeInsets.only(top: divheight * 0.03),
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            onPressed: ontap,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 16.0,
              ),
              Text(
                'SU APP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontFamily: 'CeraProB',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: divwidth * 0.54,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: CircleAvatar(
                  radius: 25.0,
                  backgroundImage: AssetImage('images/mypic.jpg'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
