import 'package:flutter/material.dart';
import 'package:bits_su_app/myapp_bar_dscreen.dart';
import 'package:bits_su_app/menu_screen.dart';
import 'package:bits_su_app/other_screen.dart';
import 'package:bits_su_app/restaurant_screen.dart';
import 'package:bits_su_app/zoom_scaffold.dart';
import 'package:bits_su_app/circular_image.dart';

final String imageUrl =
    "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

var divwidth = 0.0;
var divheight = 0.0;

class DisableIDScreen extends StatefulWidget {
  @override
  _DisableIDScreenState createState() => _DisableIDScreenState();
}

class _DisableIDScreenState extends State<DisableIDScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final menu = new Menu(
    items: [
      new MenuItem(
        id: 'restaurant',
        title: 'Search',
        icon: Icons.search,
      ),
      new MenuItem(
        id: 'other1',
        title: 'THE HERO',
        icon: Icons.healing,
      ),
      new MenuItem(
        id: 'other2',
        title: 'HELP US GROW',
        icon: Icons.info,
      ),
      new MenuItem(
        id: 'other3',
        title: 'SETTINGS',
        icon: Icons.phone,
      ),
    ],
    avatar: [
      divwidth,
      divheight,
    ],
  );

  var selectedMenuItemId = 'restaurant';
  var activeScreen = restaurantScreen;

  @override
  Widget build(BuildContext context) {
    divheight = MediaQuery.of(context).size.height;
    divwidth = MediaQuery.of(context).size.width;
    return ZoomScaffold(
      menuScreen: new MenuScreen(
        menu: menu,
        selectedItemId: selectedMenuItemId,
        onMenuItemSelected: (String itemId) {
          selectedMenuItemId = itemId;
          if (itemId == 'restaurant') {
            setState(() => activeScreen = restaurantScreen);
          } else {
            setState(() => activeScreen = otherScreen);
          }
        },
      ),
      contentScreen: activeScreen,
    );
  }
}
