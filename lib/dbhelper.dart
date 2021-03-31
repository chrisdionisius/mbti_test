import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'models/Partisipan.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';

    //create, read databases
    var itemDatabase = openDatabase(path, version: 4, onCreate: _createDb);
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE partisipan (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nama TEXT,
      kepribadian TEXT
      )
    ''');
  }

  //select databases
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    print('tampilin data');
    var mapList = await db.query('partisipan', orderBy: 'nama');
    return mapList;
  }

  //create databases
  Future<int> insert(Partisipan object) async {
    Database db = await this.initDb();
    int count = await db.insert('partisipan', object.toMap());
    print('data dah terinsert');
    return count;
  }

  //update databases
  Future<int> update(Partisipan object) async {
    Database db = await this.initDb();
    int count = await db.update('partisipan', object.toMap(),
        where: 'id=?', whereArgs: [object.id]);
    return count;
  }

  //delete databases
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('partisipan', where: 'id=?', whereArgs: [id]);
    return count;
  }

  Future<List<Partisipan>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;
    List<Partisipan> itemList = List<Partisipan>();
    for (int i = 0; i < count; i++) {
      itemList.add(Partisipan.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
