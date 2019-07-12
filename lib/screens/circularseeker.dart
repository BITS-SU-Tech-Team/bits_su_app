import 'package:flutter/material.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';
class SimpleDraggingExample extends StatefulWidget {
  @override
  _SimpleDraggingExampleState createState() => _SimpleDraggingExampleState();
}

class _SimpleDraggingExampleState extends State<SimpleDraggingExample> {
  double _thumbPercent = 0.4;

  @override
  Widget build(BuildContext context) {
    // A RadialSeekBar is built in a 150x150 square, centered on screen.
    return Center(
      child: SizedBox(
        width: 150.0,
        height: 150.0,
        child: _buildRadialSeekBar(),
      ),
    );
  }

  Widget _buildRadialSeekBar() {
    return RadialSeekBar(
      trackColor: Colors.black,
      trackWidth: 4.0,
      progressColor: Colors.red,
      progressWidth: 8.0,
      progress: _thumbPercent,
      thumb: CircleThumb(
        color: Colors.red,
        diameter: 25.0,
      ),
      thumbPercent: _thumbPercent,
      onDragUpdate: (double percent) {
        setState(() {
          _thumbPercent = percent;
        });
      },
    );
  }
}