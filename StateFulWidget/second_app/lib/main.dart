import 'package:flutter/material.dart';
import './products_manager.dart';
void main(){
  runApp(Test1App());
}

class Test1App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Testing app'),
        ),
        
        body: Column(
          children: <Widget>[
            ProductManager(),
            RaisedButton(
                onPressed: (){},
                child: Text('Second'),
            )
          ],
        ),
      ),
    );
  }
}