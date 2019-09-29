import 'package:flutter/material.dart';
import 'app_screens/first_screen.dart';

void main(){
  runApp(MyFlutterApp());
}

class MyFlutterApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Flutter Application",
      home: Scaffold(
        appBar: AppBar(
            title: Text("My Application")
        ),
        body:FirstScreen()
      ),
    );
  }

}
