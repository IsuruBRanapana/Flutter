import 'package:flutter/material.dart';
import 'app_screens/home.dart';

void main(){
  runApp(
      MaterialApp(
        title: "Identify the widgets",
        home: Scaffold(
          body: getListView(),
        ),
      )
  );
}

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