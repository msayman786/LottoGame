

import 'package:aa/pages/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayGame extends StatefulWidget{
  final int position;
  PlayGame(this.position);



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlayGameState();
  }

}
class _PlayGameState extends State<PlayGame>{
  final _minimumPadding=5.0;
  TextEditingController _name = new TextEditingController();
  TextEditingController _money = new TextEditingController();
  TextEditingController _search = new TextEditingController();
  SharedPreferences sharedPreferences;
  bool checkValue = false;
  bool loginValue = false;
  String UserName="";

  String money="";

  Widget appBarTitle = new Text(
    "Search Example",
    style: new TextStyle(color: Colors.white),
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();

  List<dynamic> _list;
  var listofnames=['abc','cba','bca'];
  var listofmoney=['abc','cba','bca'];
  bool _isSearching;
  String _searchText = "";
  List searchresult = new List();


  @override
  void initState() {
    super.initState();
    values();
    _isSearching = false;
    getCredential();
  }

  void values() {
    _list = List();
    _list.add("Indian rupee");
    _list.add("United States dollar");
    _list.add("Australian dollar");
    _list.add("Euro");
    _list.add("British pound");
    _list.add("Yemeni rial");
    _list.add("Japanese yen");
    _list.add("Hong Kong dollar");
  }
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;


    return Scaffold(
      key: globalKey,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Flexible(
                  child:
                    new ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchresult.length,
                    itemBuilder: (BuildContext context, int index) {
                      String listData = searchresult[index];
                      return new ListTile(
                        title: new Text(listData.toString()),
                        onTap: (){
                          showSnackBar(context, searchresult[index],index);

                        },
                      );
                    },
                  )
                    ),
              Container(
                height: 200,
                child: getImageAsset(),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: <Widget>[

                    SizedBox(
                      height: 5,
                    ),
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
                      controller: _money,
                      decoration: InputDecoration(
                        labelText: 'money',
                        hintText: 'Enter the money',
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



          _list=sharedPreferences.getStringList('mylist');
          listofnames=sharedPreferences.getStringList('mylist');
          listofmoney=sharedPreferences.getStringList('mylist');
          print('My shared list  $_list');

        } else {
          UserName="";

          money="";
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
      sharedPreferences.setString("username"+listofnames[widget.position], _name.text);

      sharedPreferences.setString("money"+listofnames[widget.position], _money.text);
      sharedPreferences.commit();

    });
  }

  _navigator() {
    if (_name.text.length != 0 || _money.text.length != 0) {
      // get posion here store name and money and
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          child: new CupertinoAlertDialog(
            content: new Text(
              "username or money \ncan't be empty",
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

  Widget buildAppBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: icon,
        onPressed: () {
          setState(() {
            if (this.icon.icon == Icons.search) {
              this.icon = new Icon(
                Icons.close,
                color: Colors.white,
              );
              this.appBarTitle = new TextField(
                controller: _controller,
                style: new TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                    hintStyle: new TextStyle(color: Colors.white)),
                onChanged: searchOperation,
              );
              _handleSearchStart();
            } else {
              _handleSearchEnd();
            }
          });
        },
      ),
    ]);
  }
  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Search Sample",
        style: new TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _controller.clear();
    });
  }
  void searchOperation(String searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i];
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
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
}