import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testapp/models/ContentChap_dana.dart';
import 'package:testapp/models/book_dana.dart';
import 'package:testapp/models/list_chapter.dart';
import 'package:testapp/models/list_chapter2.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    // Construct a file path to copy database to
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "database_read_book_dana.db");
    print("path" + path.toString());

// Only copy if the database doesn't exist
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
      // Load database from asset and copy
      ByteData data = await rootBundle.load(join('assets', 'database_read_book_dana.db'));
//      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      writeToFile(data, path);
      // Save copied asset to documents
//      await new File(path).writeAsBytes(bytes);

    }
    var departuresDatabase = await openDatabase(path);
    return departuresDatabase;
  }
  void writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytesSync(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }





  updateClient(ContentChapDana newBook) async {
    final db = await database;
    var res = await db.update("contentchap_dana", newBook.toMap(),
        where: "idContent = ?", whereArgs: [newBook.idContent]);
    return res;
  }

  getContentChapDana(int id) async {
    final db = await database;
    var res = await db.query("contentchap_dana", where: "idContent = ?", whereArgs: [id]);
    return res.isNotEmpty ? ContentChapDana.fromMap(res.first) : null;
  }

  getNameBook(int id) async {
    final db = await database;
    var res = await db.query("book_dana", where: "idBook = ?", whereArgs: [id]);
    return res.isNotEmpty ? BookDana.fromMap(res.first) : null;
  }

//  Future<List<BookDbModel>> getContentBooks() async {
//    final db = await database;
//
//    print("works");
//    // var res = await db.rawQuery("SELECT * FROM Client WHERE blocked=1");
//    var res = await db.query("Client", where: "blocked = ? ", whereArgs: [1]);
//
//    List<BookDbModel> list =
//    res.isNotEmpty ? res.map((c) => BookDbModel.fromMap(c)).toList() : [];
//    return list;
//  }

  Future<List<ContentChapDana>> getAllBooks() async {
    final db = await database;
    var res = await db.query("contentchap_dana");
    List<ContentChapDana> list =
    res.isNotEmpty ? res.map((c) => ContentChapDana.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<BookDana>> getAllNameBooks() async {
    final db = await database;
    var res = await db.query("book_dana");
    List<BookDana> list =
    res.isNotEmpty ? res.map((c) => BookDana.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<ListChapter>> getAllNameChaptersBook1() async {
    final db = await database;
    var res = await db.query("chap_dana");
    List<ListChapter> list =
    res.isNotEmpty ? res.map((c) => ListChapter.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<ListChapter2>> getAllNameChaptersBook2() async {
    final db = await database;
    var res = await db.query("phan_dana");
    List<ListChapter2> list =
    res.isNotEmpty ? res.map((c) => ListChapter2.fromMap(c)).toList() : [];
    return list;
  }

  deleteClient(int id) async {
    final db = await database;
    return db.delete("contentchap_dana", where: "idContent = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from contentchap_dana");
  }
}