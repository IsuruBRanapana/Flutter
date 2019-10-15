import 'package:flutter/material.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _myAppState();
  }
}

class _myAppState extends State<myApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work with Firebase',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Firebase Database",
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: formUI(),
          ),
        ),
      ),
    );

  }
  Widget formUI(){
    return Column(
      children: <Widget>[
        
      ],
    );
  }

}