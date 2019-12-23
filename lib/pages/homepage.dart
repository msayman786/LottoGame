import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aa/pages/mycontacts.dart';
import 'package:aa/pages/mypackages.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: new BorderRadius.only(
                    bottomLeft: const Radius.circular(80),
                    bottomRight: const Radius.circular(80),
                  )
                ),
                child: _landingScreen(),
              ),
            ],
          )
        )
    );
  }

  Widget _landingScreen(){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.place, size: 20, color: Colors.white,),
              SizedBox(
                width: 10,
              ),
              Text("PlanMyTrip", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Current location", style: TextStyle(color: Colors.white),),
                  SizedBox(width: 5,),
                  Icon(Icons.place, size: 10, color: Colors.white,),
                  GestureDetector(
                    onTap: (){},
                    child: Text("BOM", style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 5, left: 10),
                  hintText: "Meeting Place"
                ),
              ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _signupScreen(){
    return SingleChildScrollView(
      child: new Container(
          alignment: Alignment.center,
          color: Colors.white,
          //height: 100.0,
          //width: 200.0,
          // margin: EdgeInsets.only(left:15.0,top: 10.0),
          padding: EdgeInsets.only(
              left: 10.0, top: 25.0, right: 10.0, bottom: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: Signup_btn()),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Looking for Akbar App Click Here",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "First Name",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15.0,
                        ),
                      ),
                      Material(
                        child: TextField(),
                      ),
                      Text(
                        "First Name",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15.0,
                        ),
                      ),
                      Material(
                        child: TextField(),
                      ),
                      Text(
                        "First Name",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15.0,
                        ),
                      ),
                      Material(
                        child: TextField(),
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Text(
                      "Flight",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Baloo_Chettan',
                          fontSize: 20.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Text(
                      "Cok to BOM",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Baloo_Chettan',
                          fontSize: 10.0),
                    ),
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}

class Signup_btn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      width: 250.0,
      height: 50.0,
      child: RaisedButton(
          color: Colors.red,
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
          elevation: 6.0,
          onPressed: () => signUpfun(context)),
    );
  }

  void signUpfun(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Registered Successfully"),
      content: Text("Have a pleasant Day"),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyContacts()),
    );
  }
}
