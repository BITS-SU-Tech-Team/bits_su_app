import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
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
              SizedBox(
                height: 8.0,
              ),
              Center(
                child: Image.asset(
                  'images/id04.png',
                  height: 130.0,
                  width: 360.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 6.8),
                child: Text(
                  'Total Spendings: ',
                  style: TextStyle(
                    fontFamily: 'CeraProB',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontSize: 12.0,
                    color: Colors.blue[200],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 2.0),
                child: Text(
                  '₹ 4,500.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.8,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: TextField(
            autocorrect: false,
            decoration: InputDecoration(
              suffixIcon: Icon(
                FontAwesome.filter,
                color: Color(0xFF487DB4),
              ),
              border: InputBorder.none,
              icon: Icon(
                Icons.search,
                color: Color(0xFF487DB4),
              ),
              hintText: 'Search For Food: ',
              hintStyle: TextStyle(
                color: Color(0xFF9ECBE8),
                fontFamily: 'CeraPro',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
