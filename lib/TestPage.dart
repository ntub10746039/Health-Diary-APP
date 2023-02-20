import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestPage extends StatefulWidget {
  @override
  TestPageState createState() => TestPageState();
}

// AudioPlayer audioPlayer = AudioPlayer();
// play() async {
//   int result = await audioPlayer.play('assets/ding.mp3');
//   if (result == 1) {
//     // success
//   }
// }

// playLocal() async {
//   int result = await audioPlayer.play('assets/ding.mp3', isLocal: true);
// }
// void main() async {
//   print('456');
//   await Hive.initFlutter();
// }

// void main() async {
//   print('123');
// }

void main() async {
  //Hive.init('somePath') -> not needed in browser

  var box = await Hive.openBox('testBox');

  box.put('name', 'David');

  print('Name: ${box.get('name')}');
}

class TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          // padding: EdgeInsets.all(15.0),
          child: ElevatedButton(
            // padding: EdgeInsets.all(15),
            child: Text(
              'test',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () => main(),
          ),
        ),
      ),
    );
  }
}


// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class TestPage extends StatefulWidget {
//   @override
//   TestPageState createState() => TestPageState();
// }

// Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
//   return ListTile(
//     title: Row(
//       children: [
//         Expanded(
//             child: Text(
//           document['name'],
//           style: Theme.of(context).textTheme.headline1,
//         )),
//         Container(
//           decoration: const BoxDecoration(
//             color: Color(0xffddddff),
//           ),
//           padding: const EdgeInsets.all(10.0),
//           child: Text(
//             document['votes'].toString(),
//             // style: Theme.of(context).textTheme.dispaly1,
//           ),
//         )
//       ],
//     ),
//     onTap: () {
//       FirebaseFirestore.instance.runTransaction((transaction) async {
//         DocumentSnapshot freshSnap = await transaction.get(document.reference);
//         await transaction.update(freshSnap.reference, {
//           'votes': freshSnap['votes'] + 1,
//         });
//       });
//     },
//   );
// }

// class TestPageState extends State<TestPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             body: StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('bandnames').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return const Text('loading....');
//         return ListView.builder(
//             itemExtent: 80.0,
//             itemCount: snapshot.data.documents.length,
//             itemBuilder: (context, index) =>
//                 _buildListItem(context, snapshot.data.documents[index]));
//       },
//     )));
//   }
// }
