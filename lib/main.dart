import 'dart:async';
import 'dart:math';
import 'package:sensors/sensors.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'DataPage.dart';
import 'Use_Explain.dart';
// import '../test/ProfilePage.dart';
import 'CustomPage.dart';
import 'TestPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  runApp(MaterialApp(home: new MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  final pages = [DataPage(), HomePage(), CustomPage()];
  // final pages = [DataPage(), HomePage(), CustomPage(), TestPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Range of Motion Exercises',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new explain()),
              );
            },
          ),
        ],
      ),
      body: pages[_selectedIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: '結果',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首頁',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reorder),
            label: '自訂',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: '測試',
          // ),
        ],
        backgroundColor: Colors.white,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        //目前選擇頁索引值
        // fixedColor: Colors.black, //選擇頁顏色
        onTap: _onItemClick, //BottomNavigationBar 按下處理事件
      ),
    );
  }

  void _onItemClick(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
