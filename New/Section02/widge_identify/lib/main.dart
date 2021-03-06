import 'package:flutter/material.dart';
import 'app_screens/home.dart';

void main(){
  runApp(
      MaterialApp(
        title: "Identify the widgets",
        home: Scaffold(
          body: getListView(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: "Add item",
          ),
        ),
      )
  );
}


//for basic list
/*
Widget getListView(){
  var list=ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(
          Icons.landscape
        ),
        title: Text(
            "Landscape"
        ),
        subtitle: Text(
          "Thid is landscape"
        ),
        trailing: Icon(
          Icons.access_alarm
        ),
        onTap: (){

        },
      )
    ],
  );

  return list;

}
*/

//for long list
List<String> getListItems(){
  var items= List<String>.generate(1000, (counter)=>"Item $counter");
  return items;
}

Widget getListView(){
  var listItems=getListItems();
  var listView=ListView.builder(
      itemBuilder: (context,index){
        return ListTile(
          title: Text(
            listItems[index]
          ),
          onTap: (){
            showSnackBar(context,listItems[index]);
          },
          leading: Icon(Icons.accessibility),
        );
      }
  );
  return listView;
}

void showSnackBar(BuildContext context,String item){
  var snackBar=SnackBar(
    content: Text(" You tapped $item "),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: (){},
    ),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}