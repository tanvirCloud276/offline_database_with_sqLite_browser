import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';

class MyData {
  final int id;
  final String name;
  final String email;
  final String address;

  MyData({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
  });
}

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,
        'employeeInfo.db'); // You can keep the database name as 'employeeInfo.db'

    final databaseExists = await databaseFactory.databaseExists(path);

    if (!databaseExists) {
      ByteData data = await rootBundle.load('assets/employeeInfo.db');
      List<int> bytes = data.buffer.asUint8List();
      await File(path).writeAsBytes(bytes);
    }

    return await openDatabase(path);
  }

  Future<List<MyData>> getAllData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db
        .query('contacts'); // Replace with your table name 'employeeInfo'
    print("db:$db");
    return List.generate(maps.length, (i) {
      return MyData(
        id: maps[i]['id'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        address: maps[i]['address'],
      );
    });
  }
}
