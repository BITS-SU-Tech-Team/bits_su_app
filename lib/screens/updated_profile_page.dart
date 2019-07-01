import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'dart:math' as math;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//        floatingActionButton: FloatingActionButton.extended(
//          elevation: 4.0,
//          icon: Icon(FontAwesome.qrcode),
//          label: Text('Show QR'),
//          onPressed: () {},
//        ),
       
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
          child: new Stack(
            children: <Widget>[
              ClipPath(
                child: Container(color: Colors.black.withOpacity(0.8)),
                clipper: getClipper(),
              ),
              Positioned(
                width: 350.0,
                top: MediaQuery.of(context).size.height / 6,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://avatars1.githubusercontent.com/u/30185369?s=460&v=4'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                          boxShadow: [
                            BoxShadow(blurRadius: 7.0, color: Colors.black)
                          ]),
                    ),
                    SizedBox(height: 40.0),
                    Center(
                      child: Text(
                        'Rohit K Bharadwaj',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ),
                    SizedBox(height: 45.0),
                    Text(
                      '2017B4A70633P',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'RM 1173',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
              BottomSheetQR(),
            ],
          ),
        ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 2.25);
    path.lineTo(size.width + 275, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class BottomSheetQR extends StatefulWidget {
  @override
  _BottomSheetQRState createState() => _BottomSheetQRState();
}

const double minHeight = 60;

class _BottomSheetQRState extends State<BottomSheetQR>
    with SingleTickerProviderStateMixin {
  AnimationController _controller; //<-- Create a controller

  double get maxHeight =>
      MediaQuery.of(context).size.height; //<-- Get max height of the screen

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      //<-- initialize a controller
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }

  double get headerTopMargin =>
      lerp(20, 20 + MediaQuery.of(context).padding.top); //<-- Add new property

  double get headerFontSize => lerp(14, 24);

  double lerpDouble(num a, num b, double t) {
    if (a == null && b == null) return null;
    a ??= 0.0;
    b ??= 0.0;
    return a + (b - a) * t;
  }

  @override
  void dispose() {
    _controller.dispose(); //<-- and remember to dispose it!
    super.dispose();
  }

  double lerp(double min, double max) => lerpDouble(
      min, max, _controller.value); //<-- lerp any value based on the controller

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          height: lerp(minHeight, maxHeight * 0.8),
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: _toggle,
            onVerticalDragUpdate:
            _handleDragUpdate, //<-- Add verticalDragUpdate callback
            onVerticalDragEnd: _handleDragEnd,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Stack(
                children: <Widget>[
                  QRbutton(),
                  SheetHeader(
                    //<-- Add a header with params
                    fontSize: headerFontSize,
                    topMargin: headerTopMargin,
                    headerString:
                    _controller.status == AnimationStatus.completed
                        ? "Pull down to close"
                        : "Pull up to Show QR Code",
                  ),
                  QRImage(
                    isVisible: _controller.status == AnimationStatus.completed,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _toggle() {
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(
        velocity: isOpen ? -2 : 2); //<-- ...snap the sheet in proper direction
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta /
        maxHeight; //<-- Update the _controller.value by the movement done by user.
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity = details.velocity.pixelsPerSecond.dy /
        maxHeight; //<-- calculate the velocity of the gesture
    if (flingVelocity < 0.0)
      _controller.fling(
          velocity:
          math.max(2.0, -flingVelocity)); //<-- either continue it upwards
    else if (flingVelocity > 0.0)
      _controller.fling(
          velocity:
          math.min(-2.0, -flingVelocity)); //<-- or continue it downwards
    else
      _controller.fling(
          velocity: _controller.value < 0.5
              ? -2.0
              : 2.0); //<-- or just continue to whichever edge is closer
  }
}

class QRbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      //<-- Align the icon to bottom right corner
      left: 0,
      bottom: 16,
      child: Icon(
        FontAwesome.qrcode,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}

class QRImage extends StatelessWidget {
  final bool isVisible;

  QRImage({this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: AnimatedOpacity(
        opacity: isVisible ? 1 : 0,
        duration: Duration(milliseconds: 200),
        child: Container(
          height: 250.0,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/220px-QR_code_for_mobile_English_Wikipedia.svg.png'),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;
  final String headerString;

  const SheetHeader(
      {Key key,
        @required this.fontSize,
        @required this.topMargin,
        @required this.headerString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          headerString,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}