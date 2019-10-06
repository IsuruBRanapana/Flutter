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
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (String name){
                nameCity=name;
              },
            ),
            Text(
              "Your city is $nameCity"
            )
          ],
        ),
      ),
    );
  }

}