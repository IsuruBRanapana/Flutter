import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.lightBlue[900],
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.only(left: 4.0,right: 4.0,top: 10.0),
        width: 200.0,
        height: 500.0,
        child: Text("ABCD",
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }
}