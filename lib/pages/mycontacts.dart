import 'package:flutter/material.dart';

class MyContacts extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("My Contacts"),),
      body:
      getListView(),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          debugPrint("fab CLICKED");
        },
        child: Icon(Icons.add),
        tooltip: "Add one more Item",
      ) ,
    );
  }


}

void showSnackBar(BuildContext context,String item){
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

List<String> getListElements() {

var items = List<String>.generate(1000, (counter) => "Item $counter");


  return items;
}
Widget getListView(){
  var listItems=getListElements();
  var listView=ListView.builder(
    itemCount: listItems.length ,
      itemBuilder: (context,index){

        return ListTile(
          leading: Icon(Icons.arrow_right),
          onTap: (){
            showSnackBar(context, listItems[index]);

          },
          title: Text(listItems[index]),
        );
      }
  );
  return listView;
}
