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
  List<String> _products=['Food Tester'];
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
                  onPressed:(){
                    setState(() {
                      _products.add('Advanced Food tester');
                    });
                  },
                  child: Text('First'),
              ),
            ),

            Column(
              children: _products
                  .map(
                    (element)=>
                      Card(
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/1.jpg'),
                            Text(element)
                          ],
                        ),
                      ),
                  )
                  .toList(),
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