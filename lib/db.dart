import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:testapp/login.dart';

class db {

  intdb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

     await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              'CREATE TABLE user (id INTEGER PRIMARY KEY, name CHAR(50), mobile CHAR(50), password CHAR(50))');
          await db.execute(
              'CREATE TABLE corona_status (id INTEGER PRIMARY KEY, country_name CHAR(50), cases CHAR(50), deaths CHAR(50), total_recovered CHAR(50), new_death CHAR(50), new_cases CHAR(50))');
          //  await db.execute("INSERT INTO user SET(name, mobile, password)VALUE ('minoti mondal','7548956589','7548956589')");
          await db.insert('user', {"name": 'minoti mondal', "mobile": 7548956589, "password": 7548956589,

          });
        });
  }
  _connectDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    return await openDatabase(path, version: 1);
  }
   login(mobile,password)async{
 var db =await _connectDB();
 final result = await db.rawQuery("SELECT id FROM user WHERE mobile='$mobile' AND password ='$password'");
 print(result);
 return result.length;
   }
//  login(String mobile, String password) async {
//    var db = await _connectDB();
//    try {final users = await db.rawQuery("SELECT * FROM user where mobile='$mobile' AND password ='$password'");
//    return user;
//    } catch (e) {
//      print(e);
//    }

}