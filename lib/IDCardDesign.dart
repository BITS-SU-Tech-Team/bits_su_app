import 'package:flutter/material.dart';

class IDcard extends StatefulWidget {
  @override
  _IDcardState createState() => _IDcardState();
}

var username = 'Ayush Singh';

class _IDcardState extends State<IDcard> {
  var bottom =30.0;
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.fromLTRB(10, bottom, 10, 10),
      height: 205,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: Image.asset('images/bitslogo.png',height: MediaQuery.of(context).size.height*0.10,))),
              Container(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[

                        Text('Birla Institute of Technology & Science,'
                          ,style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900
                          ),),
                        Text('Pilani',style: TextStyle(
                            fontWeight: FontWeight.w900
                        ),),
                      ],
                    )

                    ,
                    SizedBox(
                      height: 5,
                    ),
                    Image.asset('images/image001.jpg',width: MediaQuery.of(context).size.width*0.60,height: 5,),
                    SizedBox(height: 10,),
                    Text.rich(TextSpan(
                      //  text: 'Name:  ',
                      // style: TextStyle(
                      //    fontSize: 24,
                      //   fontWeight: FontWeight.bold,
                      //  fontFamily: 'Rockwell'),
                        children: <TextSpan>[
                          TextSpan(
                              text: username.toUpperCase(),
                              style: TextStyle(

                                  fontFamily: 'Rockwell',
                                  fontSize: 16,fontWeight:FontWeight.w900
                              ))
                        ])),
                    SizedBox(
                      height: 15,
                    ),
                    Text.rich(TextSpan(
                        text: 'ID No:',
                        style: TextStyle(

                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Rockwell',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' 2018A7PS0274P'.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Rockwell',
                                fontSize: 18,
                              ))
                        ]
                    )),
                    SizedBox(height: 5,),
                    Text.rich(TextSpan(
                        text: 'Hostel:  ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Rockwell'),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'GN 2135'.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Rockwell',
                                fontSize: 18,
                              ))
                        ])),
                    SizedBox(
                      height: 10,
                    ),

                    SizedBox(height: 5,),
                    Image.asset('images/image001.jpg',width: MediaQuery.of(context).size.width*0.60,height: 5,),
                  ],
                ),
                margin: EdgeInsets.fromLTRB(5,10, 35, 0),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Text(
                    'Valid till:July 2020',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
