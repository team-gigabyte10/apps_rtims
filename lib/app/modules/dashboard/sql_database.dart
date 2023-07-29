import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  static Database? _database;

  DBHelper._internal();

  factory DBHelper() => _instance;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDB();
    return _database;
  }

  Future<Database> _initDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'locations.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE locations (id INTEGER PRIMARY KEY AUTOINCREMENT, lat REAL, lng REAL, datetime TEXT)');
    });
  }

  Future<void> insertLocation(double lat, double lng, String datetime) async {
    final db = await database;
    await db
        ?.insert('locations', {'lat': lat, 'lng': lng, 'datetime': datetime});
  }

// Future<List<Map<String, dynamic>>?> getAllLocations() async {
//   final db = await database;
//   return await db?.query('locations');
// }
}
