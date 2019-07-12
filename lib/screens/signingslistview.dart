import 'package:flutter/material.dart';

class ListDesign extends StatefulWidget {
  @override
  _ListDesignState createState() => _ListDesignState();
}

class _ListDesignState extends State<ListDesign> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (ctx, i) {
          var borderSide = BorderSide(width: 1, color: Color(0xFFE3ECF2));
          var emptySide = BorderSide(style: BorderStyle.none);
          return Container(
              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
              decoration: BoxDecoration(
                  border: Border(
                    top: i == 0 ? borderSide : emptySide,
                    bottom: borderSide,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xfff7f7f7),
                        blurRadius: 0.5,
                        spreadRadius: 0.5)
                  ]),
              child: Container(
                color: Colors.white,
                height: 85,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Image.asset('images/images.jpg')),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'APOGEE T-shirt',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xffC35F72),
                                fontFamily: 'CeraProB'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Student Union',
                            style: TextStyle(
                                color: Color(0xff4AA4D6),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Averta'),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          60, 0, 0, 0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Status',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Signed',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
