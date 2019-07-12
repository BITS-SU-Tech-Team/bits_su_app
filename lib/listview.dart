import 'package:flutter/material.dart';

class List extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff7f7f7),
      child: ListView.builder(shrinkWrap: true,itemCount: 2,itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.fromLTRB(20, 25, 20, 0),
          height: 180,
          width: double.infinity,
          decoration: BoxDecoration(
             gradient: LinearGradient(colors: [
               Color(0xffEEAA61),
              Color(0xffC35F72),

            ], begin: Alignment.topLeft, end: Alignment.bottomRight),

            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, spreadRadius: 5, color: Color(0xfff7f7f7)),
            ],
          ),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                width: MediaQuery.of(context).size.width * 0.35,
                height: 150,
                child: Image.asset('images/su.png'),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'APOGEE T-Shirt',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CeraPro',
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Student Union',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w800,),
                    ),
                    SizedBox(
                      height: 20,
                      
                    ),
                    Text('Signings Deadline:',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),),
                    Text('19 August 2019',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,),)
              ,
                    Container(width: 50,
                      height: 16,
                      decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(5))),

                      margin: EdgeInsets.fromLTRB(100, 10, 10, 10),
                      child: Center(child: Text('Signed',style: TextStyle(color: Colors.lightGreenAccent,fontSize: 14),)),

                    )
                  ],
                ),
              ),
              
            ],
            
          ),
          
        );
      }),
    );
  }
}
