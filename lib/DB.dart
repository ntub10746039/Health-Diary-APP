import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

var t=0;
class myOrientation{
  final int id;
  final String x;
  final String y;
  final String z;
  myOrientation({this.id,this.x,this.y,this.z,});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "x": x,
      "y": y,
      "z": z,
    };
  }
  @override
  String toString() {
    return "myOrientation{\n  id: $id\n  x: $x\n  y: $y\n  z: $z\n}";
  }
}

class MeasurementDB {
  static Database database;

  // Initialize database
  static Future<Database> initDatabase() async {
    database = await openDatabase(
      // Ensure the path is correctly for any platform
      join(await getDatabasesPath(), "Measurement.db"),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE t1("
                "id INTEGER PRIMARY KEY,"
                "x TEXT,"
                "y TEXT,"
                "z TEXT"
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
  static Future<List<myOrientation>> showAllData() async {
    final Database db = await getDatabaseConnect();
    final List<Map<String, dynamic>> maps = await db.query("t1");
    // print(maps);

    return List.generate(maps.length, (i) {
      return myOrientation(
        id: maps[i]["id"],
        x: maps[i]["x"],
        y: maps[i]["y"],
        z: maps[i]["z"],
      );
    });
  }

  // Insert
  static Future<void> insertData(myOrientation data) async {
    final Database db = await getDatabaseConnect();
    await db.insert(
      "t1",
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Update
  static Future<void> updateData(myOrientation data) async {
    final db = await getDatabaseConnect();
    await db.update(
      "t1",
      data.toMap(),
      where: "id = ?",
      whereArgs: [data.id],
    );
  }

  // Delete
  static Future<void> deleteData(int id) async {
    final db = await getDatabaseConnect();
    await db.delete(
      "t1",
      where: "id = ?",
      whereArgs: [id],
    );
  }
}