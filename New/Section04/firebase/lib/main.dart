import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> _key = GlobalKey();
  bool _autoValidate = false;
  String name, profession, message;
  List<DropdownMenuItem> items = [
    DropdownMenuItem(
      child: Text('Student'),
    ),
    DropdownMenuItem(
      child: Text('Professor'),
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
          padding: EdgeInsets.all(15.0),
          child: Container(
            child: Form(
              child: formUI(),
              autovalidate: _autoValidate,
            ),
          ),
        ),
      ),
    );
  }

  Widget formUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(hintText: 'Name'),
          maxLength: 32,
          onSaved: ((val) {
            name = val;
          }),
          validator: validateName,
        ),
        DropdownButton(
          items: items,
          onChanged: ((val) {
            profession = val;
          }),
          hint: Text('Profession'),
          value: profession,
        ),
        TextFormField(
          decoration: InputDecoration(hintText: 'Message'),
          maxLength: 256,
          maxLines: 5,
          onSaved: ((val) {
            message = val;
          }),
          validator: validateMessage,
        ),
        RaisedButton(
          onPressed: _sendToServer,
          child: Text('Send'),
        ),
      ],
    );
  }

  _sendToServer() {
    if(_key.currentState.validate()){
      _key.currentState.save();
    }else{
      _autoValidate=true;
    }
  }

  String validateName(String val) {
    return val.length == 0 ? 'Enter Name First' : null;
  }

  String validateMessage(String val) {
    return val.length == 0 ? 'Enter Message' : null;
  }
}
