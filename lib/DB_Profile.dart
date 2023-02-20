import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

var t=0;
class myProfile{
  final String name;
  final String gender;
  final int height;
  final int weight;
  final int age;

  myProfile({this.name,this.gender,this.height,this.weight,this.age,});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "gender": gender,
      "height": height,
      "weight": weight,
      'age':age,
    };
  }
  @override
  String toString() {
    return "myOrientation{\n  name: $name\n  gender: $gender\n  height: $height\n  weight: $weight\n age: $age\n}";
  }
}

class MeasurementDB {
  static Database database;

  // Initialize database
  static Future<Database> initDatabase() async {
    database = await openDatabase(
      // Ensure the path is correctly for any platform
      join(await getDatabasesPath(), "Profile.db"),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE t1("
                "name TEXT PRIMARY KEY,"
                "gender TEXT,"
                "height INTEGER,"
                "weight INTEGER,"
                "age INTEGER"
                ")"
        );
      },
      // Version
      version: 1,
    );

    return database;
  }

  // Check database connected
  static Future<Database> getDatabaseConnect() async {
    if (database != null) {
      return database;
    }
    else {
      return await initDatabase();
    }
  }

  // Show all data
  static Future<List<myProfile>> showAllData() async {
    final Database db = await getDatabaseConnect();
    final List<Map<String, dynamic>> maps = await db.query("t1");
    // print(maps);

    return List.generate(maps.length, (i) {
      return myProfile(
        name: maps[i]["name"],
        gender: maps[i]["gender"],
        height: maps[i]["height"],
        weight: maps[i]["weight"],
        age: maps[i]["age"],
      );
    });
  }

  // Insert
  static Future<void> insertData(myProfile data) async {
    final Database db = await getDatabaseConnect();
    await db.insert(
      "t1",
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update
  static Future<void> updateData(myProfile data) async {
    final db = await getDatabaseConnect();
    await db.update(
      "t1",
      data.toMap(),
      where: "name = ?",
      whereArgs: [data.name],
    );
  }

  // Delete
  static Future<void> deleteData(String name) async {
    final db = await getDatabaseConnect();
    await db.delete(
      "t1",
      where: "name = ?",
      whereArgs: [name],
    );
  }
}