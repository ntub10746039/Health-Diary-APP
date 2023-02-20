import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async';
import 'dart:math';
import 'HomePage.dart';

class HomePage_line_chart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePage_line_chartState();
}

class HomePage_line_chartState extends State<HomePage_line_chart> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.1,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
              Colors.white,
              // Colors.blueGrey,
              // Colors.black87,
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
                const SizedBox(
                  height: 15,
                ),
                // const Text(
                //   'Orientation',
                //   style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //       letterSpacing: 2),
                //   textAlign: TextAlign.center,
                // ),
                // const SizedBox(
                //   height:10 ,
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 0.0, left: 0.0),
                    child: LineChart(
                      sampleData(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
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
            fontSize: 15,
          ),
          margin: 10,
          // Text('123');
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '0';
              case 50:
                return '50';
              case 100:
                return '100';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case -180:
                return '-180\u00B0';
              case 0:
                return '0\u00B0';
              case 180:
                return '180\u00B0';
            }
            return '';
          },
          margin: 10,
          reservedSize: 30,
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
      maxX: 100,
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
      for (var i = 0; i < DynamicOrientation.length; i++) {
        list0.add(FlSpot(i.toDouble(), double.parse(DynamicOrientation[i][0])));
        list1.add(FlSpot(i.toDouble(), double.parse(DynamicOrientation[i][1])));
        list2.add(FlSpot(i.toDouble(), double.parse(DynamicOrientation[i][2])));
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
