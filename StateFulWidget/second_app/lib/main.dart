import 'package:flutter/material.dart';

void main(){
  runApp(Test1App());
}

class Test1App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Test1AppState();
  }
}
class _Test1AppState extends State<Test1App>{
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
            Container(
              margin: EdgeInsets.all(20.0),
              child: RaisedButton(
                  onPressed:(){},
                  child: Text('First'),
              ),
            ),
            
            Card(
              child:Column(
                children: <Widget>[
                  Image.asset('assets/1.jpg'),
                  Text('My Love')
                ],
              ),
            ),

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