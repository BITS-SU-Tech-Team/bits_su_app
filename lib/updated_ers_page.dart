import 'package:flutter/material.dart';
import 'food_items.dart';
import 'screens/Signings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:bits_su_app/IDCardDesign.dart';
import 'myapp_bar.dart';
import 'myapp_bar_dscreen.dart';

class IDCardPage extends StatefulWidget {
  @override
  _IDCardPageState createState() => _IDCardPageState();
}

class _IDCardPageState extends State<IDCardPage> {
  @override
  Widget build(BuildContext context) {
    var divheight = MediaQuery.of(context).size.height;
    var divwidth = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /* MyCustomAppBarDScreen(
              divwidth: divwidth,
              divheight: divheight,
              appBarSize: divheight * 0.5,
              ontap: () {},
            ), */

            Container(
              height: 330,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xff0095FE),
                Color(0xff046AFC),
                Color(0xff083FFE),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: SafeArea(
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'Expenses',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                fontFamily: 'PaulGrotesk',
                                letterSpacing: 1.2),
                          )),
                      alignment: Alignment.topCenter,
                    ),
                    Positioned(
                      child: IconButton(
                        icon: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                            ),
                            Positioned(
                              child: Icon(
                                Icons.brightness_1,
                                color: Colors.red,
                                size: 9.0,
                              ),
                            )
                          ],
                        ),
                        onPressed: () {
                          print('hello');
                        },
                      ),
                      top: 5,
                      right: 10,
                    ),
                    Container(
                      height: 190,
                      margin: EdgeInsets.fromLTRB(20, 62, 20, 0),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(blurRadius: 3 ,spreadRadius:1 )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    child: Container(
                                      height: 40,
                                      width: 130,
                                      child: RaisedButton(
                                        color: Color(0xffFBC411),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.block,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Block Card',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            print('hello');
                                          });
                                        },
                                      ),
                                      /* decoration: BoxDecoration(

                                        borderRadius: BorderRadius.all(Radius.circular(1000))
                                      ),*/
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    child: Container(
                                      height: 40,
                                      width: 125,
                                      child: RaisedButton(
                                        color: Color(0xff16CBF8),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.credit_card),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Set Limits',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            print('hello');
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 30, 0, 0),
                              child: Text.rich(
                                TextSpan(
                                    text: '₹',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff7783D3),
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '4500.00',
                                          style: TextStyle(
                                              fontSize: 45,
                                              color: Color(0xff7783D3),
                                              fontWeight: FontWeight.w900))
                                    ]),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Text(
                                'Total Spent',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w800),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Today',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w700),),
                  IconButton(icon: Icon(FontAwesome.filter,color: Colors.blueAccent,),onPressed:(){
                    setState(() {
                      print('Hello');
                    });
                  },)
                  ],
                )),
            FutureBuilder(
              future: _getFoodDetails(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text("Loading..."),
                    ),
                  );
                } else {
                  return ListView.builder(

                    shrinkWrap: true,
                    itemBuilder: (ctx, i) {
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
                            //  decoration: BoxDecoration(
                            //    border: Border(right: borderSide)),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Container(
                                  child: Image.asset('images/ANC logo svg.png'),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            snapshot.data[i].foodTitle,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            'Quantity: x2',
                            style: TextStyle(
                                fontFamily: 'CeraPro',
                                fontWeight: FontWeight.w700),
                          ),
                          onTap: () {},
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                '31 May',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'CeraPro',
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '₹ 100.0',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Color(0xFFDE3E46),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data.length,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Food>> _getFoodDetails() async {
  var data = await http
      .get("http://www.json-generator.com/api/json/get/cfwZmvEBbC?indent=2");

  var jsonData = json.decode(data.body);

  List<Food> foodList = [];

  for (int i = 0; i < 4; i++) {
    Food foodItem = Food(
        foodJointIcon: 0,
        date: "23 Jun",
        foodTitle: "Oreo Shake",
        foodPrice: "34",
        foodQuantity: "1");

    foodList.add(foodItem);
  }

  print(foodList.length);

  return foodList;
}
