import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final Widget child;

  // final Gradient gradient;
  final double width;
  final double height;
  final bool isEnabled;
  final Function onPressed;

  const GradientButton({
    Key key,
    @required this.child,
    // this.gradient,
    this.isEnabled,
    this.width,
    this.height,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _statusColor;
    if (isEnabled != null) {
      // Show gradient color by making material widget transparent
      if (isEnabled == true) {
        _statusColor = Colors.transparent;
      } else {
        // Show grey color if isEnabled is false
        _statusColor = Colors.grey;
      }
    } else {
      // Show grey color if isEnabled is null
      _statusColor = Colors.transparent;
    }

    return Container(
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0.6,
          ),
        ],
        borderRadius: BorderRadius.circular(48.0),
        gradient: LinearGradient(
          colors: [
            Color(0xFFF3AA20),
            Color(0xFFE89019),
          ],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
      ),
      child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(4)),
          color: _statusColor,
          child: InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: onPressed,
              child: Padding(
                padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Center(
                  child: child,
                ),
              ))),
    );
  }
}
