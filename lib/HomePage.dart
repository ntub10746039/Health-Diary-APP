import 'dart:async';
import 'dart:ffi';
// import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'homepage_line_chart.dart';
// import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
// import 'DB.dart';
// void main() => runApp(MaterialApp(home: new MyHomePage()));
import 'CustomPage.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var OrientationList = [
  ['0', '90', '0']
];
var GyroscopeList = [
  ['0', '90', '0']
];
var AccelerometerList = [
  ['0', '90', '0']
];
var DynamicOrientation = [
  ['0', '90', '0']
];
var b = 0;
var StartOrientation;
var EndOrientation;
var DifferenceOrientation;
var StartTime;
var EndTime;
var DifferenceTime;
var StartDate;
var od;
var SportsCount = 0;
var CountLock = 1;
var reciprocal;

class _HomePageState extends State<HomePage> {
  List<double> _accelerometerValues; //?：值為null
  List<double> _userAccelerometerValues;
  List<double> _gyroscopeValues;
  List<double> _orientationValues;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];
  var pitch;
  var roll;
  var yaw;
  var pitch2;
  var roll2;
  var yaw2;

  List<dynamic> a = const ['開始測量', '停止測量'];
  List<MaterialColor> ButtonColor = <MaterialColor>[Colors.blue, Colors.red];

  Color getColor() {
    return ButtonColor[b];
  }

  @override
  Widget build(BuildContext context) {
    List<String> accelerometer = [];
    List<String> gyroscope = [];
    List<String> userAccelerometer = [];
    List<String> Orientation = [];
    if (_accelerometerValues != null &&
        _gyroscopeValues != null &&
        _userAccelerometerValues != null) {
      accelerometer = _accelerometerValues
          ?.map((double v) => v.toStringAsFixed(1))
          .toList();
      gyroscope =
          _gyroscopeValues?.map((double v) => v.toStringAsFixed(1)).toList();
      userAccelerometer = _userAccelerometerValues
          ?.map((double v) => v.toStringAsFixed(1))
          .toList();
      Orientation =
          _orientationValues?.map((double v) => v.toStringAsFixed(1)).toList();
    }
    // final List<String> accelerometer = _accelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();
    // final List<String> gyroscope = _gyroscopeValues?.map((double v) => v.toStringAsFixed(1)).toList();
    // final List<String> userAccelerometer = _userAccelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();
    // final List<String> Orientation = _orientationValues?.map((double v) => v.toStringAsFixed(1)).toList();

    btnClickEvent(CurrentOrientation) {
      if (b == 0) {
        SportsCount = 0;
        OrientationList.clear();
        GyroscopeList.clear();
        AccelerometerList.clear();
        b = 1;
        StartOrientation = CurrentOrientation;
        StartDate = DateTime.now();
        StartTime = DateTime.now().millisecondsSinceEpoch;
        const period = const Duration(seconds: 1);
        var count = 0;
        Timer.periodic(period, (timer) {
          GyroscopeList.add(_gyroscopeValues
              .map((double v) => v.toStringAsFixed(1))
              .toList());
          OrientationList.add(_orientationValues
              .map((double v) => v.toStringAsFixed(1))
              .toList());
          AccelerometerList.add(_userAccelerometerValues
              .map((double v) => v.toStringAsFixed(1))
              .toList());
          // WidgetsFlutterBinding.ensureInitialized();
          // await MeasurementDB.insertData(myOrientation(
          //   id: count,
          //   x:_orientationValues.map((double v) => v.toStringAsFixed(1)).toList()[0],
          //   y:_orientationValues.map((double v) => v.toStringAsFixed(1)).toList()[1],
          //   z:_orientationValues.map((double v) => v.toStringAsFixed(1)).toList()[2],
          // ),);
          // count+=1;
          if (b == 0) {
            timer.cancel();
          }
        });
      } else {
        // od=await MeasurementDB.showAllData(); //orientation database
        // print(od);
        b = 0;
        EndOrientation = CurrentOrientation;
        DifferenceOrientation = [
          (double.parse(StartOrientation[0]) - double.parse(EndOrientation[0]))
              .toStringAsFixed(1),
          (double.parse(StartOrientation[1]) - double.parse(EndOrientation[1]))
              .toStringAsFixed(1),
          (double.parse(StartOrientation[2]) - double.parse(EndOrientation[2]))
              .toStringAsFixed(1)
        ];
      }
    }

    final devicesize = MediaQuery.of(context).size;
    final devicewidth = devicesize.width;
    final deviceheight = devicesize.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        // mainAxisAlignment: MainAxisAlignment.center, //均分空間 (均分高度)
        children: <Widget>[
          //圖表
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  // decoration: BoxDecoration(
                  //   border: Border.all(color: Colors.black, width: 1.0),
                  //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  // ),
                  width: devicewidth,
                  child: HomePage_line_chart(),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 100),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //roll
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${DynamicOrientation[DynamicOrientation.length - 1][0]}\u00B0',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 95),
              ),

              //yaw
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${DynamicOrientation[DynamicOrientation.length - 1][1]}\u00B0',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 95),
              ),

              //pitch
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${DynamicOrientation[DynamicOrientation.length - 1][2]}\u00B0',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 95),
              ),
            ],
          ),
          // Container(
          //   //方向
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Text(
          //         // '${Orientation[0].toString()}\u00B0 ${Orientation[1].toString()}\u00B0 ${Orientation[2].toString()}\u00B0'
          //         '${DynamicOrientation[DynamicOrientation.length - 1][0]}\u00B0  ${DynamicOrientation[DynamicOrientation.length - 1][1]}\u00B0  ${DynamicOrientation[DynamicOrientation.length - 1][2]}\u00B0',
          //         style: TextStyle(
          //           fontSize: 20.0,
          //           color: Colors.black,
          //         ),
          //       ),
          //     ],
          //   ),
          //   padding: const EdgeInsets.fromLTRB(0, 10, 0, 95),
          // ),

          //運動次數
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('運動次數：$SportsCount下',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    )),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 170),
          ),

          //剩餘時間
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('剩餘時間：$reciprocal秒',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    )),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 132),
          ),

          // 按鈕
          Container(
            // bottom: 100,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    // height: 100,
                    width: devicewidth * 0.9,
                    child: ElevatedButton(
                      child: Text(a[b]),
                      onPressed: () => btnClickEvent(Orientation),
                      style: ButtonStyle(
                        backgroundColor:
                            // MaterialStateProperty.all(Colors.transparent),
                            MaterialStateProperty.all<Color>(getColor()),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.fromLTRB(20, 15, 20, 15)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    side: BorderSide(color: getColor()))),
                      ),
                    ),
                  )
                ],
              ),
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 25),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    //在 APP 銷毀前會觸發這個方法，我們可以在這裡將資源釋放
    super.dispose();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  AudioPlayer audioPlayer = AudioPlayer();
  play() async {
    int result = await audioPlayer
        .play('https://taira-komori.jpn.org/sound_os/game01/select01.mp3');
    if (result == 1) {
      // success
    }
  }

  AudioPlayer audioPlayer2 = AudioPlayer();
  play2() async {
    int result = await audioPlayer2
        .play('https://taira-komori.jpn.org/sound_os/game01/select08.mp3');
    if (result == 1) {
      // success
    }
  }

  void AutoStop() {
    setState(() {
      EndTime = DateTime.now().millisecondsSinceEpoch;
      DifferenceTime = ((EndTime - StartTime) / 1000).toStringAsFixed(2);

      //倒數
      if (TimeStop != 0) {
        reciprocal =
            (TimeStop - (EndTime - StartTime) / 1000).toStringAsFixed(2);
      }

      //計數、音效
      if (AngleCount != 0) {
        if (_orientationValues[MeasurementModeValue] >= AngleCount &&
            CountLock == 1) {
          if (AudioSwtich == 1) {
            play();
          }
          SportsCount++;
          CountLock = 0;
        } else if (_orientationValues[MeasurementModeValue] <= 10 &&
            CountLock == 0) {
          if (AudioSwtich == 1) {
            play();
          }
          CountLock = 1;
        }
        if (WarningSound == 1 &&
            _orientationValues[MeasurementModeValue] <= -30 &&
            _orientationValues[MeasurementModeValue] >= -150) {
          play2();
        }
      }

      //自動停止
      if (((EndTime - StartTime) / 1000 > TimeStop && TimeStop != 0) ||
          (_orientationValues[MeasurementModeValue] > AngleStop &&
              AngleStop != 0)) {
        b = 0;
        reciprocal = TimeStop;
        EndOrientation = _orientationValues
            ?.map((double v) => v.toStringAsFixed(1))
            .toList();
        DifferenceOrientation = [
          (double.parse(StartOrientation[0]) - double.parse(EndOrientation[0]))
              .toStringAsFixed(1),
          (double.parse(StartOrientation[1]) - double.parse(EndOrientation[1]))
              .toStringAsFixed(1),
          (double.parse(StartOrientation[2]) - double.parse(EndOrientation[2]))
              .toStringAsFixed(1)
        ];
      }
    });
  }

  @override
  void initState() {
    //initState是StatefulWidget創建完後調用的第一個方法，而且只執行一次
    super.initState();
    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
        pitch = 180 *
            atan(event.x / sqrt(event.y * event.y + event.z * event.z)) /
            pi;
        roll = 180 *
            atan(event.y / sqrt(event.x * event.x + event.z * event.z)) /
            pi;
        yaw = 180 *
            atan(event.z / sqrt(event.x * event.x + event.y * event.y)) /
            pi;
        if (pitch <= 0) {
          roll2 = roll - 90;
        } else if (pitch >= 0) {
          roll2 = -(roll - 90);
        }
        if (roll >= 0) {
          if (yaw >= 0) {
            yaw2 = -(yaw - 180);
          } else {
            yaw2 = -(180 + yaw);
          }
        } else {
          yaw2 = yaw;
        }
        _orientationValues = <double>[pitch, roll2, yaw2];
        if (b == 1) {
          AutoStop();
        }
        if (DynamicOrientation.length > 100) {
          DynamicOrientation.removeAt(0);
        }
        DynamicOrientation.add(_orientationValues
            .map((double v) => v.toStringAsFixed(1))
            .toList());
        if (TimeStop != TimeStop) {
          reciprocal = TimeStop;
        }
      });
    }));
    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
    }));
    _streamSubscriptions
        .add(userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));
  }
}
