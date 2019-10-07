import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "This is the first app",
      home: ICal(),
    )
  );
}

class ICal extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ICalState();
  }
}

class _ICalState extends State<ICal>{
  var _currencies=['Rupees','Pounds','Dollars'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Interest Calculator"
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }

}

