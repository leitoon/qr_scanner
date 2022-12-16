import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_scanner/models/scan_model.dart';
export 'package:qr_scanner/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBprovider {
  static Database _database;
  static final DBprovider db = DBprovider._();

  DBprovider._();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    //path de donde se almacena la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // en el join estara el url de la base de datos
    final path = join(documentsDirectory.path, 'scansDB.db');
    print(path);
    //Crear base de datos
    return await openDatabase(path,
        //cambiar lo de la version si hay modificaciones
        version: 1,
        onOpen: (db) {}, onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          );
        
        ''');
    });
  }

  nuevoScanRow(ScanModel nuevoScan) async {
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;
    //verificar base de datos
    final db = await database;
    final res = await db.rawInsert('''
    INSERT INTO Scans(id,tipo,valor)
    VALUES ($id,'$tipo','$valor')
''');
    return res;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert('Scans', nuevoScan.toJson());
    return res;
  }

  Future<ScanModel> getScanId(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id=?', whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getTodosScan() async {
    final db = await database;
    final res = await db.query('Scans');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<List<ScanModel>> getScanPorTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery("""
    SELECT * FROM Scans WHERE tipo='$tipo'
""");
    return res.isNotEmpty ? res.map((s) => ScanModel.fromJson(s)).toList() : [];
  }

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id=?', whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scan', where: 'id=?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScan() async {
    final db = await database;
    final res = await db.rawDelete('''
    DELETE FROM Scans
''');
    return res;
  }
}
