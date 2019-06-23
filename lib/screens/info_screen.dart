import 'package:flutter/material.dart';
import 'package:bits_su_app/constants.dart';
import 'package:bits_su_app/myapp_bar.dart';
import 'package:bits_su_app/roundgradient_btn.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    var divheight =
        MediaQuery.of(context).size.height; //get the height of the mobile

    print(divheight);
    final double divh2 = MediaQuery.of(context).size.height;

    var divwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: <Widget>[
          MyCustomAppBar(
            divheight: divheight,
            divwidth: divwidth,
            appBarSize: divheight / 2 * 0.35,
          ),
          Padding(
            padding: EdgeInsets.only(top: divheight * 0.08),
            child: Center(
              child: Image.asset(
                'images/myqrCode.png',
                height: 115.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text(
              'Rohit K Bharadwaj',
              textAlign: TextAlign.center,
              style: kBlueLabelTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              '2017B4A70633P',
              style: kBlueLabelTextStyle2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'RM 1173',
              style: kBlueLabelTextStyle2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: GradientButton(
              child: Text(
                'Refresh QR Code',
                style: TextStyle(
                  fontFamily: 'CeraPro',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {},
              width: divwidth * 0.65,
            ),
          ),
        ],
      ),
    );
  }
}
