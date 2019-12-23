

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aa/pages/detail.dart';
import 'package:aa/pages/game.dart';
import 'package:aa/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SIForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIFormState();
  }
}

class _SIFormState  extends State<SIForm>{
  final _minimumPadding=5.0;
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  SharedPreferences sharedPreferences;
  bool checkValue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCredential();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple"),
      ),
      body: SingleChildScrollView(
        child: Container(

          child: Column(
            children: <Widget>[
              Container(
                // don't forget about height
                  height: 200,
              child: getImageAsset(),

              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _name,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter the pricipal',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter the email',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _phone,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        hintText: 'Enter the phone no',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _password,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter the password',
                      ),
                    ),
                  ],
                )
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: (){
                    _onChanged(true);
                    _navigator();
                  },
                  child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onChanged(bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = value;
      sharedPreferences.setBool("check", checkValue);
      sharedPreferences.setString("username", _name.text);
      sharedPreferences.setString("email", _email.text);
      sharedPreferences.setString("phone no", _phone.text);
      sharedPreferences.setString("password", _password.text);
      sharedPreferences.commit();
      getCredential();
    });
  }

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = sharedPreferences.getBool("check");
      if (checkValue != null) {
        if (checkValue) {
          _name.text = sharedPreferences.getString("username");
          _email.text = sharedPreferences.getString("email");
          _phone.text = sharedPreferences.getString("phone no");
          _password.text = sharedPreferences.getString("password");
          debugPrint(_name.text );
        } else {
          _name.clear();
          _email.clear();
          _phone.clear();
          _password.clear();
          sharedPreferences.clear();
        }
      } else {
        checkValue = false;
      }
    });
  }

  _navigator() {
    if (_name.text.length != 0 || _email.text.length != 0 || _phone.text.length != 0 || _password.text.length != 0) {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(
              builder: (BuildContext context) => new Detail()),
              (Route<dynamic> route) => false);
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          child: new CupertinoAlertDialog(
            content: new Text(
              "username or password \ncan't be empty",
              style: new TextStyle(fontSize: 16.0),
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text("OK"))
            ],
          ));
    }
  }

  Widget getImageAsset(){
    AssetImage assetImage=AssetImage("images/akbargroup.png");
    Image image=Image(image: assetImage);
    return Container(
      child:image,width: 200.0,height: 200.0,margin: EdgeInsets.all(_minimumPadding*10),
    );
  }


}