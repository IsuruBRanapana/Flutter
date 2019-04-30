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