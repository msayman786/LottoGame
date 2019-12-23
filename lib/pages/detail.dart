

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detail extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailState();
  }

}

class _DetailState extends State<Detail>{

  SharedPreferences sharedPreferences;
  bool checkValue = false;
  bool loginValue = false;
  String UserName="a";
  String Email="";
  String Phone="";
  String Password="";

  @override
  void initState() {
    super.initState();
    getCredential();
  }

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = sharedPreferences.getBool("check");
      if (checkValue != null) {
        if (checkValue) {
          UserName = sharedPreferences.getString("username");
          debugPrint(UserName);
         // Email = sharedPreferences.getString("email");
          //Phone= sharedPreferences.getString("phone no");
          Password= sharedPreferences.getString("password");
          sharedPreferences.setBool("loginValue", checkValue);
          sharedPreferences.commit();
        } else {
          UserName="";
          Email="";
          Phone="";
          Password="";
          sharedPreferences.clear();
        }
      } else {
        checkValue = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Details listed Here"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text("Name is " +UserName),
              ),
              Container(
                child: Text("Email is " +Email),
              ),
              Container(
                child: Text("Password is " +Password),
              ),
              Container(
                child: Text("Phone is " +Phone),
              ),
              Container(
                child: RaisedButton(onPressed: () async {
                  await sharedPreferences.clear();
                }),
              )
            ],

          ),
        ),
      ),
    );
  }


}