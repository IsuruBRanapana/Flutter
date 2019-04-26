import 'package:flutter/material.dart';

void main(){
  runApp(TestApp());
}

class TestApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Isuru B. Ranapana'),
        ),


        body: Column(
            children:[
              Container(
                margin: EdgeInsets.all(15.0),
                child: RaisedButton(
                  onPressed: (){},
                  child: Text('Before select'),
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/girl2.jpg'),
                    Text('Love'),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: (){},
                child: Text('This is my love'),
              ),]
        ),


      ),
    );
  }
}