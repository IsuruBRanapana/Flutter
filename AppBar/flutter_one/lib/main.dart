import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter'),
        ),

        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15.0),
              child: RaisedButton(
                onPressed: (){},
                child: Text('Order'),
              ),
            ),

            Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/Breakfast.jpg'),
                  Text('Breakfast is Ready'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}