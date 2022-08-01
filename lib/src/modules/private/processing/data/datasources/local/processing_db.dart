import 'dart:async';
import 'package:path/path.dart';
import 'package:sei_services/src/modules/private/processing/data/models/processing_model.dart';
import 'package:sei_services/src/modules/private/processing/domain/entities/processing_entity.dart';
import 'package:sqflite/sqflite.dart';

class ProcessingDB {
  static final ProcessingDB _instance = ProcessingDB.internal();
  factory ProcessingDB() => _instance;
  ProcessingDB.internal();
  static Database? _db;

  final String _processingTable = 'processingTable';
  final String _code = 'code';
  final String _date = 'date';

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDb();
      return _db!;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "processing.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database sei, int newerVersion) async {
          await sei.execute(''' 
          CREATE TABLE $_processingTable (
            $_code TEXT PRIMARY KEY, 
            $_date TEXT
          ) 
        ''');
        });
  }

  Future<void> saveProcessing(ProcessingModel processing) async {
    Database dbProcessing = await db;
    try {
      await dbProcessing.insert(_processingTable, processing.toMap());
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> deleteProcessing(String code) async {
    Database dbProcessing = await db;
    try {
      await dbProcessing.delete(_processingTable,
          where: '$_code = ?',
          whereArgs: [code]);
    } catch (error) {
      throw Exception(error);
    }
  }


  Future<List<ProcessingEntity>> getAllProcessing() async {
    Database dbProcessing = await db;
    List processingList = await dbProcessing.rawQuery("SELECT * FROM $_processingTable");
    return processingList.map((processing) => ProcessingModel.fromMap(processing)).toList();
  }

  Future<void> updateProcessing(ProcessingModel processing) async {
    try {
      Database dbProcessing = await db;
      await dbProcessing.update(
          _processingTable, processing.toMap(),
          where: "$_code = ?",
          whereArgs: [processing.code]);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future close() async {
    Database dbProcessing = await db;
    dbProcessing.close();
  }

}