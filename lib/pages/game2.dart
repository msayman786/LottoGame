import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'database_helpers.dart';

class Game2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _GameState2();
  }

}

class _GameState2 extends State<Game2> {
  SharedPreferences sharedPreferences;
  static BuildContext contexxt;
  bool aValue = false;
  static String pattern="bad";
  String dropDownStringItem1="bad";
  static var _Combination=['abc','cba','bca'];
  var _currentItemSelected='rupees';
  var listofcombination=['abc','cba','bca'];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    contexxt=context;
    return
      Scaffold(
        appBar:topAppBar,
        body:makeBody,
        bottomNavigationBar: makeBottom,
      );
  }
  final topAppBar = AppBar(
    elevation: 0.1,
    backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
    title: Text("Game"),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.list),
        onPressed: () {
          showSnackBar(contexxt, "You Clicked AppBar");
        },
      )
    ],
  );

  static final makeBody = SingleChildScrollView(
    child: Container(

      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (String userInput){
              _Combination=findAllPermutations(userInput);
              debugPrint(_Combination[1]);
              debugPrint(_Combination[0]);



              pattern=userInput;
            },

          ),
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child:Row(
                children: <Widget>[
                  Expanded(
                    child: Text("your data is: $pattern",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text("Clear"),
                      onPressed: (){
                        //_StoreValue();
                      },
                    ),
                  )
                ],
              )
          ),
          Container(
            height: 500,
            //child: _listView(),
            child: getListView(),
          ),
        ],
      ),
    ),
  );

  final makeBottom = Container(
    height: 55.0,
    child: BottomAppBar(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.blur_on, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.hotel, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_box, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
    ),
  );

  Widget _listView(){
    return ListView.builder(
      itemCount: _Combination.length,
      itemBuilder: (context, pos) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Text(_Combination[pos], style: TextStyle(
                fontSize: 18.0,
                height: 1.6,

              ),

              ),

            ),

          ),

        );

      },

    );
  }
  static getListView(){

    var listView=ListView.builder(
        itemCount: _Combination.length ,
        itemBuilder: (context,index){

          return ListTile(
            leading: Icon(Icons.arrow_right),
            onTap: (){
              showSnackBar(context, _Combination[index]);

            },
            title: Text(_Combination[index]),
          );
        }
    );
    return listView;
  }


  static void showSnackBar(BuildContext context,String item){
    var snackBar=SnackBar(
      content: Text("You just clicked $item "),
      action: SnackBarAction(
          label: "Undo",
          onPressed: (){
            debugPrint("Undo Performing");
          }
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _StoreValue() async{
    sharedPreferences = await SharedPreferences.getInstance();


  }


}



List<String> findAllPermutations(String source) {
  List allPermutations = [];

  void permutate(List list, int cursor) {
    // when the cursor gets this far, we've found one permutation, so save it
    if (cursor == list.length) {
      allPermutations.add(list);
      return;
    }

    for (int i = cursor; i < list.length; i++) {
      List permutation = new List.from(list);
      permutation[cursor] = list[i];
      permutation[i] = list[cursor];
      permutate(permutation, cursor + 1);
    }
  }

  permutate(source.split(''), 0);

  List<String> strPermutations = [];
  for (List permutation in allPermutations) {
    strPermutations.add(permutation.join());
  }

  return strPermutations;
}


