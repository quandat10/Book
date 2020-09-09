import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
final table = 'my_table';
final columnId = '_id';
final columnIdContent = 'idContent';
final columnPage = 'page';
final columnTotalPage = 'totalPage';
class SavePage {
  int idContent;
  int page;
  int id;
  int totalPage;

  SavePage();

  SavePage.fromMap(Map<String, dynamic> map){
    idContent = map[columnIdContent];
    page = map[columnPage];
    id = map[columnId];
    totalPage = map[columnTotalPage];
  }

  // convenience method to create a Map from this Word object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnIdContent: idContent,
      columnPage: page,
      columnTotalPage: totalPage
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}
class DatabaseHelper {

  static final _databaseName = "dbSavePage.db";
  static final _databaseVersion = 1;



  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnIdContent INTEGER NOT NULL,
            $columnPage INTEGER NOT NULL,
            $columnTotalPage INTEGER NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(SavePage savePage) async {
    Database db = await instance.database;
    int id = await db.insert(table, savePage.toMap());
    return id;
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<SavePage>> queryAllRows() async {
    Database db = await database;
    List<Map> maps = await db.query(table);
    if (maps.length > 0) {
      List<SavePage> pages = [];
      maps.forEach((map) => pages.add(SavePage.fromMap(map)));
      return pages;
    }
    return null;
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<SavePage> queryPage(int idContent) async {
    Database db = await database;
    List<Map> maps = await db.query(table,
        columns: [columnId, columnIdContent, columnPage, columnTotalPage],
        where: '$columnIdContent = ?',
        whereArgs: [idContent]);
    if (maps.length > 0) {
      return SavePage.fromMap(maps.first);
    }
    return null;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(SavePage savePage) async {
    Database db = await database;
    return await db.update(table, savePage.toMap(),
        where: '$columnId = ?', whereArgs: [savePage.id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}