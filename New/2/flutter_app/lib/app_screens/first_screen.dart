import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child:Center(
        child: Text(
          "First App",textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.white,
              backgroundColor:Colors.blue[200],
              fontSize: 40.0
          ),
        ),
      ),
    );
  }

}