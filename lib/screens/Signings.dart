import 'package:bits_su_app/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:bits_su_app/listview.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:bits_su_app/screens/signingslistview.dart';

class SigningsDesign extends StatefulWidget {
  @override
  _SigningsDesignState createState() => _SigningsDesignState();
}

class _SigningsDesignState extends State<SigningsDesign>
    with SingleTickerProviderStateMixin {
  var selectedbutton = false;
  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Container(
                  height: 267,
                  color: Color(0xff4B55C1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                child: Text(
                                  'Total Expenses',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xff737BCF),
                                      fontSize: 16,
                                      fontFamily: 'Bauer Grotesk OT W03 Book'),
                                )),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.notifications_none,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    print('hello ');
                                  }),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text(
                          '\$4500',
                          style: TextStyle(
                              fontSize: 34,
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 30, 0, 0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 0.2,
                                        spreadRadius: 0.2)
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: SizedBox(
                                height: 40,
                                width: 90,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: RaisedButton(
                                    elevation: 20,
                                    color: selectedbutton
                                        ? Colors.white
                                        : Color(0xff4B55C1),
                                    onPressed: () {
                                      setState(() {
                                        selectedbutton = true;
                                      });
                                    },
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      'Merchandise',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: selectedbutton
                                            ? Color(0xff4B55C1)
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 0.2,
                                        spreadRadius: 0.2)
                                  ]),
                              child: SizedBox(
                                height: 40,
                                width: 90,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: RaisedButton(
                                    elevation: 10,
                                    color: !selectedbutton
                                        ? Colors.white
                                        : Color(0xff4B55C1),
                                    onPressed: () {
                                      setState(() {
                                        selectedbutton = false;
                                      });
                                    },
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      'Signings',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        color: !selectedbutton
                                            ? Color(0xff4B55C1)
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TabBar(
                        controller: tabController,
                        labelStyle: TextStyle(
                            //up to your taste
                            fontWeight: FontWeight.w700),
                        indicatorSize:
                            TabBarIndicatorSize.label, //makes it better
                        labelColor: Colors.white, //Google's sweet blue
                        unselectedLabelColor: Color(0xff737BCF), //niceish grey
                        isScrollable: true, //up to your taste
                        indicator: MD2Indicator(
                            //it begins here
                            indicatorHeight: 3,
                            indicatorColor: Colors.white,
                            indicatorSize: MD2IndicatorSize
                                .normal //3 different modes tiny-normal-full
                            ),
                        tabs: <Widget>[
                          Tab(
                            text: "T-shirts",
                          ),
                          Tab(
                            text: "Posters",
                          ),
                          Tab(
                            text: "Hoodies",
                          ),
                          Tab(
                            text: "Mugs",
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(

              fit: FlexFit.tight,
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    Container(decoration: BoxDecoration(color: Color(0xfff7f7f7)),child: ListDesign()),
                    Container(child: ListDesign()),
                    Container(child: ListDesign()),
                    Container(child: ListDesign()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
