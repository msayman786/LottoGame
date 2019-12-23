import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Anas extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _anas();
  }

}

class _anas extends State<Anas> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:appbar() ,
      body: SingleChildScrollView(
          child:Sorting()
      ),
    );
  }
  Widget appbar(){
    return AppBar(
      title: Text("Sort & Filter"), backgroundColor: Colors.red[900],
    );
  }

  Widget Sorting() {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
     child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Sorting",style: TextStyle(fontSize: 20,))
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                      Icons.star_border
                  ),
                  Text("Popularity",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 10),),

                ],
              )
             ,
              Column(
                children: <Widget>[
                  Icon(
                      Icons.arrow_upward
                  ),
                  Column(
                    children: <Widget>[
                      Text("Price:",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 10),),
                      Text("Low to High",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 10),),

                    ],
                  ),


                ],
              )
              ,
              Column(
                children: <Widget>[
                  Icon(
                      Icons.arrow_downward
                  ),
                  Column(
                    children: <Widget>[
                      Text("Price:",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 10),),
                      Text("High to Low",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 10),),

                    ],
                  ),


                ],
              )
              ,

              Column(
                children: <Widget>[
                  Icon(
                      Icons.star
                  ),
                  Column(
                    children: <Widget>[
                      Text("User Rating:",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 10),),
                      Text("High to Low",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 10),),

                    ],
                  ),


                ],
              )
              ,
            ],
          )

        ],
      )
    );
  }
}