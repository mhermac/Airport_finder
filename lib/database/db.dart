import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DB{

  // final database = openDatabase(
  //     join(await getDatabasesPath(), 'doggie_database.db'),
  //     onCreate: (db, version) {
  // return db.execute(
  // 'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
  // );
  // },
  // // Set the version. This executes the onCreate function and provides a
  // // path to perform database upgrades and downgrades.
  // version: 1,
  // );

  aa(db){
    print("DB is Open");
    print(db);
  }

  openDb() async{


    //var dbPath = join(await getDatabasesPath(), '/Users/mhersimonyan/Desktop/DB');
    //print(dbPath);
  var databasePath = join(await getDatabasesPath(), '/Users/mhersimonyan/Desktop/');
  String path = join(databasePath, 'DB');
  if (await Directory(dirname(path)).exists()) {

  } else {
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (e) {
          print(e);
        }
  }
    database = openDatabase(path);
  }
  var database;
}