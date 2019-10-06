import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title:"The Stateful Widget",
      home: CitiWidget(),
    )
  );
}

class CitiWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavouriteCitiWidget();
  }
}

class _FavouriteCitiWidget extends State<CitiWidget>{
  String nameCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "StateFul Widget"
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (String name){
                setState(() {
                  nameCity=name;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
                "Your city is $nameCity"
              ),
            )
          ],
        ),
      ),
    );
  }

}