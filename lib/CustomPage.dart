import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'HomePage.dart';

class CustomPage extends StatefulWidget {
  @override
  CustomPageState createState() => CustomPageState();
}

var AngleCount = 90;
var TimeStop = 0;
var AngleStop = 0;
var AudioSwtich = 1;
var MeasurementModeValue = 1;
var MeasurementModeName = ['', '肩屈肌三角肌試驗', '關節活動運動'];
var MeasurementModeSelect = '肩屈肌三角肌試驗';
var WarningSound = 0;

class CustomPageState extends State<CustomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Text(
                    '測量模式 ：',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: DropdownButton(
                    value: MeasurementModeValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (var newValue) {
                      setState(() {
                        MeasurementModeValue = newValue;
                        MeasurementModeSelect =
                            MeasurementModeName[MeasurementModeValue];
                      });
                    },
                    items: <DropdownMenuItem<int>>[
                      DropdownMenuItem(
                        child: Text('肩屈肌三角肌試驗'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('關節活動運動'),
                        value: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Text(
                    '提示音效 ：',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: DropdownButton(
                    value: AudioSwtich,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (var newValue) {
                      setState(() {
                        AudioSwtich = newValue;
                      });
                    },
                    items: <DropdownMenuItem<int>>[
                      DropdownMenuItem(
                        child: Text('開'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('關'),
                        value: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Text(
                    '警告音效 ：',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: DropdownButton(
                    value: WarningSound,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (var newValue) {
                      setState(() {
                        WarningSound = newValue;
                      });
                    },
                    items: <DropdownMenuItem<int>>[
                      DropdownMenuItem(
                        child: Text('開'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('關'),
                        value: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Text(
                    '計數角度 ：',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: DropdownButton(
                    value: AngleCount,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (var newValue) {
                      setState(() {
                        AngleCount = newValue;
                      });
                    },
                    items: <DropdownMenuItem<int>>[
                      DropdownMenuItem(
                        child: Text('無'),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text('15 \u00B0'),
                        value: 15,
                      ),
                      DropdownMenuItem(
                        child: Text('30 \u00B0'),
                        value: 30,
                      ),
                      DropdownMenuItem(
                        child: Text('45 \u00B0'),
                        value: 45,
                      ),
                      DropdownMenuItem(
                        child: Text('60 \u00B0'),
                        value: 60,
                      ),
                      DropdownMenuItem(
                        child: Text('75 \u00B0'),
                        value: 75,
                      ),
                      DropdownMenuItem(
                        child: Text('90 \u00B0'),
                        value: 90,
                      ),
                      DropdownMenuItem(
                        child: Text('105 \u00B0'),
                        value: 105,
                      ),
                      DropdownMenuItem(
                        child: Text('120 \u00B0'),
                        value: 120,
                      ),
                      DropdownMenuItem(
                        child: Text('135 \u00B0'),
                        value: 135,
                      ),
                      DropdownMenuItem(
                        child: Text('150 \u00B0'),
                        value: 150,
                      ),
                      DropdownMenuItem(
                        child: Text('165 \u00B0'),
                        value: 165,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Text(
                    '自動停止時間 ：',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: DropdownButton(
                    value: TimeStop,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (var newValue) {
                      setState(() {
                        TimeStop = newValue;
                        reciprocal = TimeStop;
                      });
                    },
                    items: <DropdownMenuItem<int>>[
                      DropdownMenuItem(
                        child: Text('無'),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text('10秒'),
                        value: 10,
                      ),
                      DropdownMenuItem(
                        child: Text('20秒'),
                        value: 20,
                      ),
                      DropdownMenuItem(
                        child: Text('30秒'),
                        value: 30,
                      ),
                      DropdownMenuItem(
                        child: Text('40秒'),
                        value: 40,
                      ),
                      DropdownMenuItem(
                        child: Text('50秒'),
                        value: 50,
                      ),
                      DropdownMenuItem(
                        child: Text('1分鐘'),
                        value: 60,
                      ),
                      DropdownMenuItem(
                        child: Text('2分鐘'),
                        value: 120,
                      ),
                      DropdownMenuItem(
                        child: Text('3分鐘'),
                        value: 180,
                      ),
                      DropdownMenuItem(
                        child: Text('4分鐘'),
                        value: 240,
                      ),
                      DropdownMenuItem(
                        child: Text('5分鐘'),
                        value: 300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Text(
                    '自動停止角度 ：',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: DropdownButton(
                    value: AngleStop,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (var newValue) {
                      setState(() {
                        AngleStop = newValue;
                      });
                    },
                    items: <DropdownMenuItem<int>>[
                      DropdownMenuItem(
                        child: Text('無'),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text('15 \u00B0'),
                        value: 15,
                      ),
                      DropdownMenuItem(
                        child: Text('30 \u00B0'),
                        value: 30,
                      ),
                      DropdownMenuItem(
                        child: Text('45 \u00B0'),
                        value: 45,
                      ),
                      DropdownMenuItem(
                        child: Text('60 \u00B0'),
                        value: 60,
                      ),
                      DropdownMenuItem(
                        child: Text('75 \u00B0'),
                        value: 75,
                      ),
                      DropdownMenuItem(
                        child: Text('90 \u00B0'),
                        value: 90,
                      ),
                      DropdownMenuItem(
                        child: Text('105 \u00B0'),
                        value: 105,
                      ),
                      DropdownMenuItem(
                        child: Text('120 \u00B0'),
                        value: 120,
                      ),
                      DropdownMenuItem(
                        child: Text('135 \u00B0'),
                        value: 135,
                      ),
                      DropdownMenuItem(
                        child: Text('150 \u00B0'),
                        value: 150,
                      ),
                      DropdownMenuItem(
                        child: Text('165 \u00B0'),
                        value: 165,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
