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
  final _minimumPadding=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Interest Calculator"
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding),
        child: Column(
          children: <Widget>[
            getImageAssets(),

            Padding(
                padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Principle",
                      hintText: "Enter Principle like eg:-5000",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))
                  ),
                )
            ),

            Padding(
                padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                child:TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Rate of Interest",
                      hintText: "In percent",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))
                  ),
                )
            ),

          ],
        ),
      ),
    );
  }

  Widget getImageAssets(){
    AssetImage assetImage=AssetImage('images/cur.png');
    Image image=Image(
      width: 125.0,
      height: 125.0,
      image: assetImage,
    );

    return Container(
      child: image,
    );
  }

}

