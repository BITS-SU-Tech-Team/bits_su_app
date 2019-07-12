import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';

class Bezier extends StatefulWidget {
  final int backgroundcolour;
  int linecolour;
  int textcolour;
  Bezier(this.backgroundcolour,this.linecolour,this.textcolour);
  @override
  _BezierState createState() => _BezierState();
}

class _BezierState extends State<Bezier> {
  @override
  Widget build(BuildContext context) {
    final fromDate = DateTime(2018, 11, 22);
    final toDate = DateTime.now();

    final date1 = DateTime.now().subtract(Duration(days: 2));
    final date2 = DateTime.now().subtract(Duration(days: 3));

    final date3 = DateTime.now().subtract(Duration(days: 35));
    final date4 = DateTime.now().subtract(Duration(days: 36));

    final date5 = DateTime.now().subtract(Duration(days: 65));
    final date6 = DateTime.now().subtract(Duration(days: 64));

    return Center(
      child: Container(
        
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        decoration: BoxDecoration(color: Color(widget.backgroundcolour),borderRadius: BorderRadius.all(Radius.circular(10))),
        height: MediaQuery.of(context).size.height / 3.8,
        width: MediaQuery.of(context).size.width * 0.9,
        child: BezierChart(
          bezierChartScale: BezierChartScale.MONTHLY,
          fromDate: fromDate,
          toDate: toDate,
          selectedDate: toDate,
          series: [
            BezierLine(
              label: "Expenses",
              onMissingValue: (dateTime) {
                if (dateTime.month.isEven) {
                  return 10.0;
                }
                return 5.0;
              },
              data: [
                DataPoint<DateTime>(value: 10, xAxis: date1),
                DataPoint<DateTime>(value: 50, xAxis: date2),
                DataPoint<DateTime>(value: 20, xAxis: date3),
                DataPoint<DateTime>(value: 80, xAxis: date4),
                DataPoint<DateTime>(value: 14, xAxis: date5),
                DataPoint<DateTime>(value: 30, xAxis: date6),
              ],
              lineColor: Color(widget.linecolour),
            )
          ],
          config: BezierChartConfig(
            verticalIndicatorStrokeWidth: 3.0,
            verticalIndicatorColor: Colors.black26,
            showVerticalIndicator: true,
            xLinesColor: Color(0xffFC726E),
            xAxisTextStyle: TextStyle(
              color: Color(widget.textcolour),
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
            yAxisTextStyle: TextStyle(color: Colors.black, fontSize: 10),
            verticalIndicatorFixedPosition: false,
            footerHeight: 30.0,
          ),
        ),
      ),
    );
  }
}
