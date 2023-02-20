import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async';
import 'dart:math';
import 'HomePage.dart';

class Accelerometer_line_chart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Accelerometer_line_chartState();
}

double max = -999;
double min = 999;
double maxY() {
  for (var i = 0; i < AccelerometerList.length; i++) {
    for (var y = 0; y <= 2; y++) {
      if (double.parse(AccelerometerList[i][y]) > max) {
        max = double.parse(AccelerometerList[i][y]);
      }
    }
  }
  return max * 1.1;
}

double minY() {
  for (var i = 0; i < AccelerometerList.length; i++) {
    for (var y = 0; y <= 2; y++) {
      if (double.parse(AccelerometerList[i][y]) < min) {
        min = double.parse(AccelerometerList[i][y]);
      }
    }
  }
  return min * 1.1;
}

class Accelerometer_line_chartState extends State<Accelerometer_line_chart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.1,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
            colors: [
              Colors.white10,
              Colors.white10,
              Colors.white10,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // const SizedBox(
                //   height: 18,
                // ),
                // const Text(
                //   '加速度計',
                //   style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //       letterSpacing: 2),
                //   textAlign: TextAlign.center,
                // ),
                const SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 10.0, left: 10.0, top: 10, bottom: 10),
                    child: LineChart(
                      sampleData(),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 15,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  LineChartData sampleData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black12.withOpacity(0.6),
          tooltipRoundedRadius: 10,
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: false,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          margin: 10,
          getTitles: (value) {
            if (value == 0) {
              return '0s';
            }
            if (value == ((AccelerometerList.length - 1) / 2).toInt()) {
              var s = ((AccelerometerList.length - 1) / 2).toInt();
              return s.toString() + 's';
            }
            if (value == AccelerometerList.length - 1) {
              return (AccelerometerList.length - 1).toString() + 's';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case -5:
                return '-5';
              case 0:
                return '0';
              case 5:
                return '5';
            }
            return '';
          },
          margin: 9,
          reservedSize: 25,
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: const Border(
          bottom: BorderSide(
            color: Colors.white70,
            width: 1,
          ),
          left: BorderSide(
            color: Colors.white70,
            width: 1,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: AccelerometerList.length.toDouble() - 1,
      maxY: maxY(),
      minY: minY(),
      lineBarsData: linesBarData(),
    );
  }
  // double max = 0;
  // double min = 999;

  // getGyroscope() {
  //   for (var i = 0; i < AccelerometerList.length; i++) {
  //     for (var y = 0; i <= 2; i++) {
  //       if (double.parse(AccelerometerList[i][y]) > max) {
  //         max = double.parse(AccelerometerList[i][y]);
  //       }
  //       if (double.parse(AccelerometerList[i][y]) < min) {
  //         min = double.parse(AccelerometerList[i][y]);
  //       }
  //     }
  //   }
  //   // if (double.parse(AccelerometerList[i][0]) > max) {
  //   //   max = double.parse(AccelerometerList[i][0]);
  //   // }
  //   // if (double.parse(AccelerometerList[i][1]) > max) {
  //   //   max = double.parse(AccelerometerList[i][1]);
  //   // }
  //   // if (double.parse(AccelerometerList[i][2]) > max) {
  //   //   max = double.parse(AccelerometerList[i][2]);
  //   // }
  //   // return max;
  // }

  // getMinGyroscopeList() {
  //   for (var i = 0; i < AccelerometerList.length; i++) {
  //     if (double.parse(AccelerometerList[i][0]) < min) {
  //       min = double.parse(AccelerometerList[i][0]);
  //     }
  //     if (double.parse(AccelerometerList[i][1]) < min) {
  //       min = double.parse(AccelerometerList[i][1]);
  //     }
  //     if (double.parse(AccelerometerList[i][2]) < min) {
  //       min = double.parse(AccelerometerList[i][2]);
  //     }
  //   }
  //   return min;
  // }

  List<LineChartBarData> linesBarData() {
    List<FlSpot> list0 = [];
    List<FlSpot> list1 = [];
    List<FlSpot> list2 = [];
    setState(() {
      for (var i = 0; i < AccelerometerList.length; i++) {
        list0.add(FlSpot(i.toDouble(), double.parse(AccelerometerList[i][0])));
        list1.add(FlSpot(i.toDouble(), double.parse(AccelerometerList[i][1])));
        list2.add(FlSpot(i.toDouble(), double.parse(AccelerometerList[i][2])));
      }
    });
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: list0,
      isCurved: true,
      colors: [
        const Color(0xff4af699),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: list1,
      isCurved: true,
      colors: [
        const Color(0xffaa4cfc),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        // const Color(0x00aa4cfc),
        const Color(0x00aa4cfc),
      ]),
    );
    final LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: list2,
      isCurved: true,
      colors: const [
        Color(0xff27b6fc),
      ],
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
    ];
  }
}
