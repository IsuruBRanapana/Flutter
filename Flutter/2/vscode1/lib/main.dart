import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My App',
      home: Material(
        color: Colors.lightBlue,
        child: Center (
          child:Text(
            'Hello World',
            textDirection: TextDirection.ltr,
            style:TextStyle(
              color:Colors.white,
              fontSize: 40.0,
            ) ,
          ),
        ) 
      ) ,
    ),
  );    
}