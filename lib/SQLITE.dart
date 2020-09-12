import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testapp/dashboard.dart';
import 'package:testapp/login.dart';
import 'db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SQLITE extends StatefulWidget {
  @override
  _SQLITEState createState() => _SQLITEState();
}

class _SQLITEState extends State<SQLITE> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupDatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
  setupDatabase()async{
    await db().intdb();
    final checklogin =await _islogin();
    if(checklogin== true){
      goTodashboard();
    }else{
    await goToLogin();
  }}
  goToLogin()async{
    Route route= MaterialPageRoute(builder: (context) =>login());
    Navigator.pushReplacement(context, route);
   // Navigator.pushReplacement(
     // context, MaterialPageRoute(builder: (context) => Homepage()),
   // );

  }
  goTodashboard()async{
    Route route= MaterialPageRoute(builder: (context) =>dashboard());
    Navigator.pushReplacement(context, route);}
  _islogin()async{
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    return localstorage.getBool('is_login') == null ? false: localstorage.getBool('is_login');
  }
}
