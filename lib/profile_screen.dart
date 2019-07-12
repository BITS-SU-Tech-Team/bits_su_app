 import 'package:flutter/material.dart';
import 'zoom_scaffold.dart';
import 'constants.dart';
import 'myapp_bar.dart';
import 'package:bits_su_app/roundgradient_btn.dart';

final Screen profileScreen = new Screen(
    title: '',
    isID: false,
    contentBuilder: (BuildContext context) {
      var divwidth = MediaQuery.of(context).size.width;
      var divheight = MediaQuery.of(context).size.height;
      return Column(
        children: <Widget>[
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
      );
    });
