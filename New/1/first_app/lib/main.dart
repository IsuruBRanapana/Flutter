import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "My Flutter Application",
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Application")
        ),
        body: Material(
          color: Colors.blue,
          child:Center(
            child: Text(
                "First App",textDirection: TextDirection.ltr,
              style: TextStyle(
                  color: Colors.white,
                  backgroundColor:Colors.blue[200],
              ),
            ),
          ),
        ),
      ),
    )
  );
}
