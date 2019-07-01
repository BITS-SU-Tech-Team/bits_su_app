import 'package:flutter/material.dart';
class Signings extends StatefulWidget {
  @override
  _SigningsState createState() => _SigningsState();
}
Color bg = Color(0xff08599B);
Color buttonbg = Color(0xffFCAD01);
Color signingsbg = Color(0xffEFF4F8);
Color text = Color(0xff377DB6);
var HidePassword = true;
class _SigningsState extends State<Signings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: signingsbg,
        body: Column(children: <Widget>[

          Stack(children: <Widget>[
            Container(
              height: 220,
              width: double.infinity,
              color: Colors.transparent,
              child: Container(
                decoration: new BoxDecoration(
                    color: bg,
                    borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(40),
                        bottomRight: const Radius.circular(40))),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 180, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 70,
                    child: RaisedButton(
                        onPressed: () {
                          print('hello');
                        },
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.shopping_cart,
                              color: bg,
                            ),
                            Text(
                              'Signings',
                              style: TextStyle(
                                  color: bg,
                                  fontSize: 20,
                                  fontFamily: 'Rockwell',
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)))),
                  ),
                  // SizedBox(
                  // width: 20,
                  // ),
                  Container(
                    width: 150,
                    height: 70,
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        print('hello');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(
                            Icons.audiotrack,
                            color: bg,
                          ),
                          Text(
                            'Events',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20, fontFamily: 'Rockwell', color: bg),
                          ),
                        ],
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),

          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('hello');
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    width: double.infinity,
                    height: 125,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Card(
                        color: bg,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: SizedBox(
                                    width: 20,
                                    height: 4,
                                  ),
                                  //        color: buttonbg,
                                  decoration: new BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                    color: buttonbg,
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Text(
                                      'Apogee T-shirt',
                                      style: TextStyle(
                                          fontFamily: 'Rockwell',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24,
                                          color: Colors.white),
                                    )),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  child: Text(
                                    'Student Union',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Rockwell',
                                    ),
                                  ),
                                )
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Image.asset('assets/su.png'),
                            ),
                          ],
                        ),
                        elevation: 10,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}