import 'package:flutter/material.dart';
import 'package:aa/pages/homepage.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,

        child: Column(
          children: <Widget>[
            LogoImage(),
            Home_btn()
          ],
        )
      ),
    );
  }

}

class LogoImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage=AssetImage("images/akbargroup.png");
    Image image=Image(image: assetImage);
    return Container(child:image,width: 500.0,height: 500.0,);
  }

}

class Home_btn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: 250.0,
      height: 50.0,
      child: RaisedButton(
        color: Colors.red,
          child: Text("Home",
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.white
          ),),
          elevation: 6.0,
          onPressed: (){

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home_Screen()),
            );


          }),
    );
  }

}