import 'package:flutter/material.dart';
import 'food_items.dart';
import 'screens/Signings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
             MyCustomAppBarDScreen(
                divwidth: divwidth,
                divheight: divheight,
                appBarSize: divheight * 0.5,
                ontap: () {},
              ),



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
                    return Expanded(
                      child: ListView.builder(
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
                                decoration: BoxDecoration(
                                    border: Border(right: borderSide)),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.fastfood,
                                    color: Color(0xFF498AC1),
                                  ),
                                ),
                              ),
                              title: Text(
                                snapshot.data[i].foodTitle,
                                style: TextStyle(
                                  fontFamily: 'CeraProB',
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4381C1),
                                ),
                              ),
                              subtitle: Text(
                                'Quantity: x2',
                                style: TextStyle(
                                  fontFamily: 'CeraPro',
                                  fontStyle: FontStyle.italic,
                                  color: Color(0xFF8BBDE8),
                                ),
                              ),
                              onTap: () {},
                              trailing: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    '₹ 100.0',
                                    style: TextStyle(
                                      fontFamily: 'CeraProB',
                                      color: Color(0xFFDE3E46),
                                    ),
                                  ),
                                  Text(
                                    '31 May',
                                    style: TextStyle(
                                      fontFamily: 'CeraPro',
                                      color: Color(0xFFAACDED),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: snapshot.data.length,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
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
