import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int currentpage;
  var sizes = ['L', 'M', 'XL', 'XXL'];
  var currentselected = 'L';
  @override
  void initState() {
    currentpage = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff4B55C1),
        Color(0xff3F51B5),
        Color(0xff673AB7),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 80,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 1,
                        )
                      ]),
                  height: MediaQuery.of(context).size.height * 0.45,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Stack(
                    children: <Widget>[
                      PageView(
                        controller: PageController(initialPage: 1),
                        children: <Widget>[
                          Image.asset('images/images.jpg'),
                          Image.asset('images/images.jpg'),
                          Image.asset('images/images.jpg')
                        ],
                        onPageChanged: (value) {
                          setState(() {
                            currentpage = value;
                          });
                        },
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: DotsIndicator(
                          dotsCount: 3,
                          position: currentpage,
                          decorator: DotsDecorator(
                            activeColor: Color(0xff3F51B5),
                            size: const Size.square(9.0),
                            activeSize: const Size(20.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  'Apogee T-Shirt',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'CeraPro',
                      color: Colors.white),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 1,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."',
                    maxLines: 15,
                    style: TextStyle(fontSize: 14,fontFamily: 'Montserrat'),
                  )),
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter Name',
                        hintStyle: TextStyle(color: Colors.white)),
                  )),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text(
                          'Select Size:',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Montserrat',
                              fontSize: 18),
                        )),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            color: Colors.white),
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: DropdownButton<String>(
                          items: sizes.map((String dropdownstringitem) {
                            return DropdownMenuItem<String>(
                              value: dropdownstringitem,
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(20, 5, 5, 0),
                                  child: Text(dropdownstringitem)),
                            );
                          }).toList(),
                          onChanged: (String selected) {
                            setState(() {
                              this.currentselected = selected;
                            });
                          },
                          value: currentselected,
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Current Status :',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '   Registered',
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(
                'Signing Deadline: 26 August 2019',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cera Pro'),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 15),
                  decoration: BoxDecoration(
boxShadow: [
  BoxShadow(blurRadius: 3,spreadRadius: 2)
],
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  width: 250,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: RaisedButton(elevation: 5,
color: Colors.white,
                      onPressed: () {
                        setState(() {
                          var limit = MediaQuery.of(context).size.height;
                          Fluttertoast.showToast(
                            msg: '$limit',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            textColor: Colors.black,
                            fontSize: 16,
                          );
                        });
                      },
                      child: Text(
                        'Cancel Signing',
                        style: TextStyle(
                          color: Color(0xff3F51B5),
                          fontSize: 20,
                          fontFamily: 'CeraPro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textColor:Color(0xffC35F72)                                                                                    ,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
