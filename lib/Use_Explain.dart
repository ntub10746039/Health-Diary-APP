import 'package:flutter/material.dart';

class explain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text("說明",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              child: Text(
                '肩屈肌三角肌試驗 (shoulder flexion deltoid test)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
            Container(
              child: Text(
                '1. 將手機用手機臂套固定於受試者的手臂。',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            ),
            Container(
              child: Text(
                '2. 請受試者拿起水瓶。',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            ),
            Container(
              child: Text(
                '3. 按下開始測量按鈕開始測量。',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 50),
            ),
            Container(
              child: Text(
                '關節活動運動 (Range of Motion Exercises)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
            Container(
              child: Text(
                '1. 依據要運動的項目選擇計數角度。',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            ),
            Container(
              child: Text(
                '2. 將手機用手機臂套固定於要測量的部位。',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
            ),
            Container(
              child: Text(
                '3. 按下開始測量按鈕開始測量。',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 50),
            ),
            Container(
              child: Text(
                '角度說明',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
            Container(
              child: Image.asset(
                'assets/angle.png',
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
          ],
        ));
  }
}
