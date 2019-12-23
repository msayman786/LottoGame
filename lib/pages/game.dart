import 'package:aa/pages/playgame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'database_helpers.dart';

class Game extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _GameState();
  }

}

class _GameState extends State<Game> {
  SharedPreferences sharedPreferences;
  BuildContext contexxt;
  bool aValue = false;
  bool checkValue = false;
  String pattern="bad";
  String dropDownStringItem1="bad";
  var _Combination=['abc','cba','bca'];
  var _currentItemSelected='rupees';
  var listofnames=['abc','cba','bca'];
  var listofmoney=['abc','cba','bca'];

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    contexxt=context;
    return
        Scaffold(
      appBar:topAppBar,
      body:SingleChildScrollView(
        child: Container(

          margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (String userInput){
                  _Combination=findAllPermutations(userInput);
                 debugPrint(_Combination[1]);
                  debugPrint(_Combination[0]);
                  listofnames=_Combination;
                  listofmoney=_Combination;
                  setState(() {
                    pattern=userInput;
                  });
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
                          _StoreValue();
                          },
                        ),
                      ),
                      Expanded(
                        child: RaisedButton(
                          child: Text("Get Value"),
                          onPressed: (){
                            _getValue();
                          },
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                width: 120.0,
                color: Colors.blueGrey,
                constraints: new BoxConstraints(
                  maxHeight: 150.0,
                ),
                child: new SingleChildScrollView(
                  reverse: true,
                  child: new Wrap(
                  children: _Combination.map((String text) {
                      return new Chip(
                        label: new Text(text),
                        onDeleted: () {
                          setState(() {
                            _Combination.remove(text);
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                height: 1000,
                //child: _listView(),
                child: getListView(),
              ),

            ],
          ),
        ),
      ),
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

        },
      )
    ],
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
            onPressed: () {


            },
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
  Widget getListView(){


print("added here");

    var listView=ListView.builder(
        itemCount: _Combination.length ,
        itemBuilder: (context,index){

          return ListTile(
            leading: Icon(Icons.arrow_right),
            onTap: (){
              showSnackBar(context, _Combination[index]+listofnames[index]+listofmoney[index],index);

            },
            title: Text(_Combination[index]+" Name "+listofnames[index] +" given "+listofmoney[index]),
          );
        }
    );
    return listView;
  }
  void showSnackBar(BuildContext context,String data ,int position){
    var snackBar=SnackBar(
      content: Text("You just clicked $data "),
      action: SnackBarAction(
          label: "Undo",
          onPressed: (){
            debugPrint("Undo Performing");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlayGame(position)),
            );
          }
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _StoreValue() async{
    sharedPreferences = await SharedPreferences.getInstance();


    print('My list  $_Combination');
    sharedPreferences.setBool("check", checkValue);
    await sharedPreferences.setStringList('mylist', _Combination);
    int k=0;
    while(k<=_Combination.length){
      k++;
      listofnames[k]=sharedPreferences.getString('username'+_Combination[k]);
      listofmoney[k]=sharedPreferences.getString('money'+_Combination[k]);
    }



  }

  Future<void> _getValue() async {

    sharedPreferences = await SharedPreferences.getInstance();

    var sssd=await sharedPreferences.getStringList('mylist');
    var ssse=await sharedPreferences.getStringList('listofnames');
    var sssf=await sharedPreferences.getStringList('listofmoney');
    print('Your list  $sssd');
    print('Your list  $ssse');
    print('Your list  $sssf');

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


