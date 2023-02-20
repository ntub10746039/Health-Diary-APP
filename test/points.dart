// import 'dart:math';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:flutter/material.dart';
//
// class PointsLineChart extends StatelessWidget {
//   final List<charts.Series> seriesList;
//   // late bool animate;
//
//   PointsLineChart(this.seriesList);
//
//   /// Creates a [LineChart] with sample data and no transition.
//   factory PointsLineChart.withSampleData() {
//     return new PointsLineChart(
//       _createSampleData(),
//     );
//   }
//
//   factory PointsLineChart.withRandomData() {
//     return new PointsLineChart(_createRandomData(),);
//   }
//
//   /// Create random data.
//   static List<charts.Series<LinearSales, num>> _createRandomData() {
//     final random = new Random();
//
//     final data = [
//       new LinearSales(0, random.nextInt(100)),
//       new LinearSales(1, random.nextInt(100)),
//       new LinearSales(2, random.nextInt(100)),
//       new LinearSales(3, random.nextInt(100)),
//     ];
//
//     return [
//       new charts.Series<LinearSales, int>(
//         id: 'Sales',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (LinearSales sales, _) => sales.year,
//         measureFn: (LinearSales sales, _) => sales.sales,
//         data: data,
//       )
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new charts.LineChart(seriesList,
//         animate: false,
//         behaviors: [
//           new charts.ChartTitle('Seconds',
//               behaviorPosition: charts.BehaviorPosition.bottom,
//               titleOutsideJustification:
//               charts.OutsideJustification.middleDrawArea),
//           new charts.ChartTitle('Orientation',
//               behaviorPosition: charts.BehaviorPosition.start,
//               titleOutsideJustification:
//               charts.OutsideJustification.middleDrawArea),
//         ],
//         defaultRenderer: new charts.LineRendererConfig(includePoints: true));
//   }
//
//   /// Create one series with sample hard coded data.
//   static List<charts.Series<LinearSales, int>> _createSampleData() {
//     final data = [
//       new LinearSales(0, 5),
//       new LinearSales(1, 25),
//       new LinearSales(2, 100),
//       new LinearSales(3, 75),
//     ];
//
//     return [
//       new charts.Series<LinearSales, int>(
//         id: 'Sales',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (LinearSales sales, _) => sales.year,
//         measureFn: (LinearSales sales, _) => sales.sales,
//         data: data,
//       )
//     ];
//   }
// }
//
// /// Sample linear data type.
// class LinearSales {
//   final int year;
//   final int sales;
//   LinearSales(this.year, this.sales);
// }

import 'package:flutter/material.dart';
// import 'sales_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class LineChart extends StatelessWidget {

  // Defining the data
  final data = [
    new SalesData(0, 1500000),
    new SalesData(1, 1735000),
    new SalesData(2, 1678000),
    new SalesData(3, 1890000),
    new SalesData(4, 1907000),
    new SalesData(5, 2300000),
    new SalesData(6, 2360000),
    new SalesData(7, 1980000),
    new SalesData(8, 2654000),
    new SalesData(9, 2789070),
    new SalesData(10, 3020000),
    new SalesData(11, 3245900),
    new SalesData(12, 4098500),
    new SalesData(13, 4500000),
    new SalesData(14, 4456500),
    new SalesData(15, 3900500),
    new SalesData(16, 5123400),
    new SalesData(17, 5589000),
    new SalesData(18, 5940000),
    new SalesData(19, 6367000),
  ];

  _getSeriesData() {
    List<charts.Series<SalesData, int>> series = [
      charts.Series(
          id: "Sales",
          data: data,
          domainFn: (SalesData series, _) => series.year,
          measureFn: (SalesData series, _) => series.sales,
          colorFn: (SalesData series, _) => charts.MaterialPalette.blue.shadeDefault
      )
    ];
    return series;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Line Chart Example'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            height: 550,
            padding: EdgeInsets.all(10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Sales of a company over the years",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: new charts.LineChart(_getSeriesData(), animate: true,),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
class SalesData {
  final int year;
  final int sales;

  SalesData(this.year, this.sales);
}