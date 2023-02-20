import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'HomePage.dart';
import 'Orientation_line_chart.dart';
import 'Gyroscope_line_chart.dart';
import 'Accelerometer_line_chart.dart';
import 'CustomPage.dart';

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    final devicewidth = devicesize.width;
    final deviceheight = devicesize.height;
    if (OrientationList.length == 1) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text(
                  '無法顯示資料',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )
            ]),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly, //均分空間 (均分高度)
          children: <Widget>[
            //測量日期
            Container(
              child: Text(
                // '${StartDate.year}/${StartDate.month}/${StartDate.day} ${StartDate.hour}:${StartDate.minute}:${StartDate.second}',
                '測量日期：${StartDate.year}/${StartDate.month}/${StartDate.day}',
                style: TextStyle(
                  fontSize: 20.0,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                // textAlign: TextAlign.center,
              ),
              padding: const EdgeInsets.fromLTRB(20, 30, 0, 15),
            ),

            //測量模式
            Container(
              child: Text(
                '測量模式：$MeasurementModeSelect',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
            ),

            //測量時間
            Container(
              child: Text(
                '測量時間：$DifferenceTime 秒',
                style: TextStyle(
                  fontSize: 20.0,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                // textAlign: TextAlign.center,
              ),
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
            ),

            //運動次數
            Container(
              child: Text(
                '運動次數：$SportsCount 下',
                style: TextStyle(
                  fontSize: 20.0,
                  // fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                // textAlign: TextAlign.center,
              ),
              padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
            ),

            //方向儀
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/orientation.png',
                          height: 25,
                        ),
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                        child: Text(
                          '方向儀',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: devicewidth,
                    height: deviceheight / 5,
                    child: new Orientation_line_chart(),
                  ),
                ],
              ),
            ),

            //陀螺儀
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/gyroscope.png',
                          height: 25,
                        ),
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                        child: Text(
                          '陀螺儀',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: devicewidth,
                    height: deviceheight / 5,
                    child: new Gyroscope_line_chart(),
                  ),
                ],
              ),
            ),

            //加速規
            Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/acceleration.png',
                          height: 25,
                        ),
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                        child: Text(
                          '加速規',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: devicewidth,
                    height: deviceheight / 5,
                    child: new Accelerometer_line_chart(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
