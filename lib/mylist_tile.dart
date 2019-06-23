import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    Key key,
    @required this.trailing,
    @required this.title,
    @required this.leading,
  }) : super(key: key);

  final Widget trailing;
  final Text title;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          leading,
          SizedBox(
            width: 40.0,
          ),
          title,
          SizedBox(
            width: 40.0,
          ),
          trailing,
        ],
      ),
    );
  }
}
