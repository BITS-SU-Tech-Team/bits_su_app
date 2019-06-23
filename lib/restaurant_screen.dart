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

final Screen restaurantScreen = new Screen(
    title: '',
    contentBuilder: (BuildContext context) {
      return Container(
        child: FutureBuilder(
          future: _getFoodDetails(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return Expanded(
                child: ListView.separated(
                  itemCount: snapshot.data.length,
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 1,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: SizedBox(
                        height: double.infinity,
                        width: 100,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.phone, color: Colors.blue),
                            VerticalDivider(),
                          ],
                        ),
                      ),
                      title: Text(snapshot.data[index].foodTitle),
                      subtitle: Text(snapshot.data[index].foodQuantity),
                      onTap: () {},
                      trailing: Icon(Icons.keyboard_arrow_right,
                          color: Colors.yellow, size: 30.0),
                    );
//                    return MyListTile(
//                      leading: Row(
//                        mainAxisSize: MainAxisSize.min,
//                        children: <Widget>[
//                          Icon(Icons.phone, color: Colors.blue),
//                          VerticalDivider(),
//                        ],
//                      ),
//                      title: Text(snapshot.data[index].foodTitle),
//                      trailing: Icon(Icons.keyboard_arrow_right,
//                          color: Colors.yellow, size: 30.0),
//                    );
                  },
                ),
              );
            }
          },
        ),
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

final makeCard = Card(
  elevation: 8.0,
  margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  child: Container(
    decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
    child: makeListTile,
  ),
);

final makeListTile = ListTile(
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  leading: Container(
    padding: EdgeInsets.only(right: 12.0),
    decoration: new BoxDecoration(
      color: Colors.black,
      border: Border(
        right: BorderSide(width: 1.0, color: Colors.white24),
      ),
    ),
    child: Icon(Icons.autorenew, color: Colors.white),
  ),
  title: Text(
    "Introduction to Driving",
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

  subtitle: Row(
    children: <Widget>[
      Icon(Icons.linear_scale, color: Colors.yellowAccent),
      Text(" Intermediate", style: TextStyle(color: Colors.white))
    ],
  ),
  trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
);

class _RestaurantCard extends StatelessWidget {
  final String headImageAssetPath;
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final int heartCount;

  _RestaurantCard({
    this.headImageAssetPath,
    this.icon,
    this.iconBackgroundColor,
    this.title,
    this.subtitle,
    this.heartCount,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: new Card(
        elevation: 10.0,
        child: new Column(
          children: [
            new Image.asset(
              headImageAssetPath,
              width: double.infinity,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            new Row(
              children: [
                new Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: new Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      color: iconBackgroundColor,
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(15.0)),
                    ),
                    child: new Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                ),
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text(
                        title,
                        style: const TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'mermaid',
                        ),
                      ),
                      new Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'bebas-neue',
                          letterSpacing: 1.0,
                          color: const Color(0xFFAAAAAA),
                        ),
                      ),
                    ],
                  ),
                ),
                new Container(
                  width: 2.0,
                  height: 70.0,
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white,
                        const Color(0xFFAAAAAA),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: new Column(
                    children: [
                      new Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                      new Text(
                        '$heartCount',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
