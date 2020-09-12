
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';




import 'dashboard.dart';
import 'db.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {


  @override
  void initState() {
    super.initState();

  }
  String mobile="";
  String password="";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
          body: Padding(
              //padding: EdgeInsets.symmetric(horizontal: 30.0),
              padding: EdgeInsets.only(top: 50),
              child: Column(children: <Widget>[
                Container(
                    child: Text(
                      "log in",
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "mobile",
                    hintStyle: TextStyle(
                      color: Colors.purple,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  onChanged: (value){
                    setState(() {
                      mobile= value;
                    });
                  },
                ),
                TextField(
                    decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                  onChanged: (value){
                      setState(() {
                        password = value;
                      });
                  },
                ),
                Container(
                width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(20),
                  child: FlatButton(
                    child: Text('Login'),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: _login,
                  ),
                )
              ]))),

    );}
    _login()async {
      try {
        final result = await db().login(mobile.toString(), password.toString());
        if(result> 0){
         await _store(mobile.toString(),password.toString());
await goToLogin();
        }else{
          Fluttertoast.showToast(
              msg: "This is Center Short Toast",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
        print(result);
      }catch(e){
        print(e.toString());
      }
      }
  goToLogin()async{
    Route route= MaterialPageRoute(builder: (context) =>dashboard());
    Navigator.pushReplacement(context, route);
  }
  _store(mobile,password)async{
    SharedPreferences localstorage = await SharedPreferences.getInstance();
    localstorage.setString('mobile', mobile);
    localstorage.setString('password', password);
    localstorage.setBool('is_login', true);
  }
    }