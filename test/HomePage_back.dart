import 'dart:async';

// import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'homepage_line_chart.dart';


// void main() => runApp(MaterialApp(home: new MyHomePage()));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

var OrientationList = [['0','90','0']];
var b = 0;
var DynamicOrientation=[['0','90','0']];

class _HomePageState extends State<HomePage> {
  List<double>? _accelerometerValues; //?：值為null
  List<double>? _userAccelerometerValues;
  List<double>? _gyroscopeValues;
  List<double>? _orientationValues;
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];
  var pitch;
  var roll;
  var yaw;

  List<dynamic> a = const ['Start', 'Stop'];
  List<MaterialColor> ButtonColor = <MaterialColor>[
    Colors.lightBlue,
    Colors.red
  ];
  var M_PI = 3.14159265358979323846;
  var StartOrientation;
  var EndOrientation;
  var DifferenceOrientation;
  var StartTime;
  var EndTime;
  var DifferenceTime;


  Color getColor() {
    return ButtonColor[b];
  }

  @override
  Widget build(BuildContext context) {
    final List<String>? accelerometer =
        _accelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();
    final List<String>? gyroscope =
        _gyroscopeValues?.map((double v) => v.toStringAsFixed(1)).toList();
    final List<String>? userAccelerometer = _userAccelerometerValues
        ?.map((double v) => v.toStringAsFixed(1))
        .toList();
    final List<String>? Orientation =
        _orientationValues?.map((double v) => v.toStringAsFixed(1)).toList();


    btnClickEvent(CurrentOrientation) {
      if (b == 0) {
        //StartMeasurement
        OrientationList.clear();
        b = 1;
        StartOrientation = CurrentOrientation;
        StartTime = DateTime.now().millisecondsSinceEpoch;
        const period = const Duration(seconds: 1);
        Timer.periodic(period, (timer) {
          OrientationList.add(_orientationValues!.map((double v) => v.toStringAsFixed(1)).toList());
          // print('OrientationList$OrientationList');
          // print(DynamicOrientation);
          if (b == 0) {
            timer.cancel();
          }
        });
      } else {
        //StopmMasurement
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

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('老當益壯',textAlign: TextAlign.center),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, //均分空間 (均分高度)
        children: <Widget>[
          Container(
            //加速度
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Accelerometer: $accelerometer'),
              ],
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          Container(
            //使用者加速度
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('UserAccelerometer: $userAccelerometer'),
              ],
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          Container(
            //陀螺儀
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Gyroscope: $gyroscope'),
              ],
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          Container(
            //方向
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Orientation: '+Orientation![0].toString()+'\u00B0 '+Orientation[1].toString()+'\u00B0 '+Orientation[2].toString()+'\u00B0'),
              ],
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          Container(
            //開始測量
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text(a[b]),
                  onPressed: () => btnClickEvent(Orientation),
                  color: getColor(),
                )
              ],
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          Container(
            //開始數值
            child: Text('Start Orientation: $StartOrientation'),
            padding: const EdgeInsets.all(10.0),
          ),
          Container(
            //結束數值
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('End Orientation: $EndOrientation'),
              ],
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          Container(
            //數值差距
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Difference Orientation: $DifferenceOrientation'),
              ],
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          Container(
            //經過時間
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Elapsed Time (seconds) : $DifferenceTime'),
              ],
            ),
            padding: const EdgeInsets.all(10.0),
          ),
          Container(
            //圖表
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 300,
                  child: LineChartSample1(),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10.0),
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

  void AutoStopMeasurement() {
    setState(() {

      EndTime = DateTime.now().millisecondsSinceEpoch;
      DifferenceTime = ((EndTime - StartTime) / 1000).toStringAsFixed(2);
      if (((double.parse(StartOrientation[1]) - roll).abs()) > 15) {
        b = 0;
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
            M_PI;
        roll = 180 *
            atan(event.y / sqrt(event.x * event.x + event.z * event.z)) /
            M_PI;
        yaw = 180 *
            atan(event.z / sqrt(event.x * event.x + event.y * event.y)) /
            M_PI;
        // yaw=180*atan(event.z/sqrt(event.x*event.x+event.z*event.z))/M_PI;
        _orientationValues = <double>[pitch, roll, yaw];
        // if (b == 1) {
        //   AutoStopMeasurement();
        // }
        if (DynamicOrientation.length>100){
          DynamicOrientation.removeAt(0);
        }
        DynamicOrientation.add(_orientationValues!.map((double v) => v.toStringAsFixed(1)).toList());

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
