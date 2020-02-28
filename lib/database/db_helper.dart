import 'dart:io';

  

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "lott_calc.db";
  static final _databaseVersion = 1;

  static final tableUser = 'User';
  // static final tableCancel = 'CancelTbl';

  static final columnId = 'id';
  static final columnusername = 'username';
  static final columnfullname = 'fullname';
  static final columnpassword = 'password';
  static final columnemail = 'email';
  static final columphone = 'phone';

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
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableUser (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnusername TEXT NOT NULL,
            $columnfullname TEXT NOT NULL,
            $columnpassword INTEGER NOT NULL,
            $columnemail INTEGER NOT NULL,
            $columphone INTEGER NOT NULL
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row, TableName tblname) async {
    Database db = await instance.database;
    return tblname == TableName.user
        ? await db.insert(tableUser, row)
        : await db.insert(tableUser, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows(TableName tblname) async {
    Database db = await instance.database;
    return tblname == TableName.user
        ? await db.query(tableUser)
        : await db.query(tableUser);
  }

  checkLogin(String username, String password) async {
    Database db = await instance.database;
    return await db.query(tableUser,
        where: '$columnusername=? AND $columnpassword=?',
        whereArgs: [username, password]);
  }

  // Future<List<Map<String, dynamic>>> queryAllRowsToday(
  //     TableName tblname) async {
  //   String formatedDate = DateFormat("dd-MM-yyyy")
  //       .format(DateTime.parse(DateTime.now().toString()));
  //   Database db = await instance.database;
  //   return tblname == TableName.user
  //       ? await db.query(tableCancel,
  //           where: '$columnDate=? ', whereArgs: [formatedDate])
  //       : await db.query(tableReport,
  //           where: '$columnDate=? ', whereArgs: [formatedDate]);
  // }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  // Future<int> queryRowCount( TableName tblname) async {
  //   Database db = await instance.database;
  //   return Sqflite.firstIntValue(
  //       await db.rawQuery('SELECT COUNT(*) FROM $table'));
  // }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  // Future<int> update(
  //     {Map<String, dynamic> row, int id, TableName tableName}) async {
  //   Database db = await instance.database;
  //   return tableName == TableName.cancel
  //       ? await db
  //           .update(tableCancel, row, where: '$columnId = ?', whereArgs: [id])
  //       : await db
  //           .update(tableReport, row, where: '$columnId = ?', whereArgs: [id]);
  // }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  // Future<int> delete(int id, TableName tblname) async {
  //   Database db = await instance.database;
  //   return tblname == TableName.cancel
  //       ? await db.delete(tableCancel, where: '$columnId = ?', whereArgs: [id])
  //       : await db.delete(tableReport, where: '$columnId = ?', whereArgs: [id]);
  // }

  // getCountInReport(String formatedDate, int number) async {
  //   // check number exist in respective date and game method
  //   Database db = await instance.database;
  //   return await db.query(tableReport,
  //       where:
  //           '$columnDate=? AND $columnnumber=? AND $columnsuper=1 OR $columnbox=1',
  //       whereArgs: [formatedDate, number]);
  // }

  // deleteAllByDate(DateTime subtract) async {
  //   String formatedDate = DateFormat("dd-MM-yyyy").format(subtract);
  //   Database db = await instance.database;
  //   await db
  //       .delete(tableCancel, where: '$columnDate=?', whereArgs: [formatedDate]);
  //   await db
  //       .delete(tableReport, where: '$columnDate=?', whereArgs: [formatedDate]);
  //   return true;
  // }

  // Future deleteNumber(int number) async {
  //   String formatedDate = DateFormat("dd-MM-yyyy")
  //       .format(DateTime.parse(DateTime.now().toString()));
  //   Database db = await instance.database;
  //   await db.delete(tableReport,
  //       where: '$columnDate=? AND $columnnumber=? AND $isActive=1',
  //       whereArgs: [formatedDate, number]);
  //   await db.delete(tableCancel,
  //       where: '$columnDate=? AND $columnnumber=? AND $isActive=1',
  //       whereArgs: [formatedDate, number]);
  // }

  // disable(TableName tblName, int id) async {
  //   Database db = await instance.database;
  //   tblName == TableName.cancel
  //       ? await db.rawUpdate('UPDATE $tableCancel SET $isActive=0')
  //       : await db.rawUpdate('UPDATE $tableReport SET $isActive=0 ');
  // }

  // doesExistInReport(int number, RadioButtons btnValue) async {
  //   Database db = await instance.database;
  //   return btnValue == RadioButtons.supper
  //       ? await db.query(tableReport,
  //           where: '$columnnumber=? AND $columnsuper=1', whereArgs: [number])
  //       : await db.query(tableReport,
  //           where: '$columnnumber=? AND $columnbox=1', whereArgs: [number]);
  // }

  // checkExist(String formatedDate, int number, TableName tableName) async {
  //   Database db = await instance.database;
  //   return tableName == TableName.report
  //       ? await db.query(tableReport,
  //           where: '$columnnumber=? AND $columnDate=?',
  //           whereArgs: [number, formatedDate])
  //       : await db.query(tableCancel,
  //           where: '$columnnumber=? AND $columnDate=? AND $isActive=1',
  //           whereArgs: [number, formatedDate]);
  // }
}

enum TableName { user }
