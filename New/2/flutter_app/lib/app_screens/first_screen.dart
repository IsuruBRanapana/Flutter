import 'dart:math';

import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child:Center(
        child: Text(
          genarateLuckyNumber(),
          textDirection: TextDirection.ltr,
          style: TextStyle(
              color: Colors.white,
              backgroundColor:Colors.blue[200],
              fontSize: 30.0
          ),
        ),
      ),
    );
  }


  String genarateLuckyNumber(){
    var random=Random();
    int lucky=random.nextInt(10);

    return "Your Lucky number is $lucky";
  }

}