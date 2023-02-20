import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async';
import 'dart:math';
import 'HomePage.dart';

class Orientation_line_chart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Orientation_line_chartState();
}

class Orientation_line_chartState extends State<Orientation_line_chart> {
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
                //   '方向儀',
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
            if (value == ((OrientationList.length - 1) / 2).toInt()) {
              var s = ((OrientationList.length - 1) / 2).toInt();
              return s.toString() + 's';
            }
            if (value == OrientationList.length - 1) {
              return (OrientationList.length - 1).toString() + 's';
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
              case -90:
                return '-90\u00B0';
              case 0:
                return '0\u00B0';
              case 90:
                return '90\u00B0';
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
      maxX: OrientationList.length.toDouble() - 1,
      maxY: 180,
      minY: -180,
      lineBarsData: linesBarData(),
    );
  }

  List<LineChartBarData> linesBarData() {
    List<FlSpot> list0 = [];
    List<FlSpot> list1 = [];
    List<FlSpot> list2 = [];
    setState(() {
      for (var i = 0; i < OrientationList.length; i++) {
        list0.add(FlSpot(i.toDouble(), double.parse(OrientationList[i][0])));
        list1.add(FlSpot(i.toDouble(), double.parse(OrientationList[i][1])));
        list2.add(FlSpot(i.toDouble(), double.parse(OrientationList[i][2])));
      }
    });
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: list0,
      isCurved: true,
      colors: [
        const Color(0xff93c47d),
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
        const Color(0xff6fa8dc),
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
        Color(0xffF44336),
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
