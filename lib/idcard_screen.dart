import 'package:flutter/material.dart';
import 'zoom_scaffold.dart';
import 'myapp_bar_dscreen.dart';
import 'food_items.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'mylist_tile.dart';

//Container(
//child: Expanded(
//child: ListView.builder(
//scrollDirection: Axis.vertical,
//shrinkWrap: true,
//itemCount: 10,
//itemBuilder: (BuildContext context, int index) {
//return makeCard;
//},
//),
//),
//);

//Container(
//padding: EdgeInsets.only(right: 12.0),
//decoration: new BoxDecoration(
//border: Border(
//right: BorderSide(
//width: 3.0, color: Color(0xFFE9F1FC)),
//),
//),
//child: Icon(Icons.autorenew, color: Colors.blue),
//),

final Screen idCardScreen = new Screen(
    title: '',
    isID: true,
    contentBuilder: (BuildContext context) {
      var divwidth = MediaQuery.of(context).size.width;
      var divheight = MediaQuery.of(context).size.height;
      return FutureBuilder(
        future: _getFoodDetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);
          if (snapshot.data == null) {
            return Container(child: Center(child: Text("Loading...")));
          } else {
            return Expanded(
//                child: ListView.separated(
//                  itemCount: snapshot.data.length,
//                  separatorBuilder: (context, index) {
//                    return Divider(
//                      height: 1,
//                    );
//                  },
//                  itemBuilder: (BuildContext context, int index) {
//                    return ListTile(
//                      leading: SizedBox(
//                        height: double.infinity,
//                        width: 100,
//                        child: Row(
//                          mainAxisSize: MainAxisSize.min,
//                          children: <Widget>[
//                            Icon(Icons.phone, color: Colors.blue),
//                            VerticalDivider(),
//                          ],
//                        ),
//                      ),
//                      title: Text(snapshot.data[index].foodTitle),
//                      subtitle: Text(snapshot.data[index].foodQuantity),
//                      onTap: () {},
//                      trailing: Icon(Icons.keyboard_arrow_right,
//                          color: Colors.yellow, size: 30.0),
//                    );
////                    return MyListTile(
////                      leading: Row(
////                        mainAxisSize: MainAxisSize.min,
////                        children: <Widget>[
////                          Icon(Icons.phone, color: Colors.blue),
////                          VerticalDivider(),
////                        ],
////                      ),
////                      title: Text(snapshot.data[index].foodTitle),
////                      trailing: Icon(Icons.keyboard_arrow_right,
////                          color: Colors.yellow, size: 30.0),
////                    );
//                  },
//                ),
              child: ListView.builder(
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
                        decoration:
                            BoxDecoration(border: Border(right: borderSide)),
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
      );
    });

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
