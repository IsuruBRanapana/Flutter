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
  String nameCity = "";
  var _cur=['rs','dol','pou','other'];
  var _currentCur='rs';
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

            DropdownButton<String>(
              items: _cur.map((String mapItem) {
                return DropdownMenuItem<String>(
                  value: mapItem,
                  child: Text(mapItem),
                );
              }).toList(),
              onChanged: (String newValueSelected){
                setState(() {
                    this._currentCur=newValueSelected;
                });
              },
              value: _currentCur,
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