import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:projek_uas/models/mactivity.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;  

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'activity.db';

    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    return todoDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE activity (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        durasi TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('activity', orderBy: 'name');
    return mapList;
  }


  Future<int> insert(Activity object) async {
    Database db = await this.database;
    int count = await db.insert('activity', object.toMap());
    return count;
  }

  Future<int> update(Activity object) async {
    Database db = await this.database;
    int count = await db.update('activity', object.toMap(), 
                                where: 'id=?',
                                whereArgs: [object.id]);
    return count;
  }

  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('activity', 
                                where: 'id=?', 
                                whereArgs: [id]);
    return count;
  }

  Future<List<Activity>> getActivityList() async {
    var activityMapList = await select();
    int count = activityMapList.length;
    List<Activity> activityList = List<Activity>();
    for (int i=0; i<count; i++) {
      activityList.add(Activity.fromMap(activityMapList[i]));
    }
    return activityList;
  }

}