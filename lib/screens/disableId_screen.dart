 import 'package:flutter/material.dart';
import 'package:bits_su_app/myapp_bar_dscreen.dart';
import 'package:bits_su_app/menu_screen.dart';
import 'package:bits_su_app/other_screen.dart';
import 'package:bits_su_app/idcard_screen.dart';
import 'package:bits_su_app/zoom_scaffold.dart';
import 'package:bits_su_app/circular_image.dart';
import 'info_screen.dart';
import 'package:bits_su_app/profile_screen.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

final String imageUrl =
    "https://avatars1.githubusercontent.com/u/30185369?s=460&v=4";

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
        id: 'profilepg',
        title: 'Profile',
        icon: FontAwesome.user,
      ),
      new MenuItem(
        id: 'idcardpg',
        title: 'ID Card',
        icon: FontAwesome.id_card,
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

  var selectedMenuItemId = 'profilepg';
  var activeScreen = profileScreen;

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
          if (itemId == 'profilepg') {
            setState(() => activeScreen = profileScreen);
          } else if (itemId == 'idcardpg') {
            setState(() => activeScreen = idCardScreen);
          } else {
            setState(() => activeScreen = InfoScreen() as Screen);
          }
        },
      ),
      contentScreen: activeScreen,
    );
  }
}
