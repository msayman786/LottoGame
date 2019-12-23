

import 'package:aa/pages/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginState();
  }

}
class _LoginState extends State<Login>{
  final _minimumPadding=5.0;
  TextEditingController _name = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  SharedPreferences sharedPreferences;
  bool checkValue = false;
  bool loginValue = false;
  String UserName="";

  String Password="";

  @override
  void initState() {
    super.initState();
    getCredential();
  }


  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Simple"),
      ),
    body: SingleChildScrollView(
     child: Container(
       child: Column(
         children: <Widget>[
           Container(
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
                     labelText: 'User Name',
                     hintText: 'Enter the mobile number',
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
             ),
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
               child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
             ),
           )
         ],
       ),
     ),
    ),
    );
  }
  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = sharedPreferences.getBool("check");
      if (checkValue != null) {
        if (checkValue) {
          UserName = sharedPreferences.getString("username");
          debugPrint(UserName);
          loginValue=sharedPreferences.getBool("loginValue");
          debugPrint(loginValue.toString());
          if(loginValue){
            debugPrint("hello");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Detail()),
            );
          }

          Password= sharedPreferences.getString("password");
        } else {
          UserName="";

          Password="";
          sharedPreferences.clear();
        }
      } else {
        checkValue = false;
      }
    });
  }
  _onChanged(bool value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkValue = value;
      sharedPreferences.setBool("check", checkValue);
      sharedPreferences.setString("username", _name.text);

      sharedPreferences.setString("password", _password.text);
      sharedPreferences.commit();

    });
  }

  _navigator() {
    if (_name.text.length != 0 || _password.text.length != 0) {
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