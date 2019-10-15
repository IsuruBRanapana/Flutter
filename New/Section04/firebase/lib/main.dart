import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  String name,profession,message;
  List<DropdownMenuItem> items=[
    DropdownMenuItem(
      child:Text(
        'Student'
      ),
    ),
    DropdownMenuItem(
      child:Text(
          'Professor'
      ),
    ),
  ];
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
        TextFormField(
          decoration: InputDecoration(hintText: 'Name'),
          maxLength: 32,
        ),
        DropdownButton(
          items: items,
          onChanged: ((val){
            profession=val;
          }),
        )
      ],
    );
  }

}