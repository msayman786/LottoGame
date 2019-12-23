
import 'package:flutter/material.dart';

class MyPackages extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("My Packages"),),
body: getListView(),
    );
  }

  Widget getListView() {
    var listView=ListView(
      children: <Widget>[
        ListTile(
         leading:Icon(Icons.landscape),
          title: Text("LandScape"),
          subtitle: Text("Beautiful view"),
          trailing: Icon(Icons.wb_sunny),
          onTap: (){
           debugPrint(" first icon tapped");
          },
        ),
        ListTile(
          leading:Icon(Icons.landscape),
          title: Text("LandScape"),
          subtitle: Text("Beautiful view"),
          trailing: Icon(Icons.wb_sunny),
        )
      ],
    );
    return listView;
  }

}