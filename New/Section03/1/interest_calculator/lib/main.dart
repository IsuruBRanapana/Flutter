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
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(_minimumPadding*10),
              child: getImageAssets(),
            ),


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

            Padding(
              padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
                child:Row(
                  children: <Widget>[
                    Expanded(
                        child:TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Term",
                              hintText: "Time in years",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))
                          ),
                        )
                    ),

                    Container(width: _minimumPadding*5,),
                    Expanded(
                        child:DropdownButton<String>(
                          items: _currencies.map((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }
                          ).toList(),

                          value: 'Rupees',

                          onChanged: (String newValueSelected){

                          },
                        )
                    )
                  ],
                )
            ),

            Padding(
              padding: EdgeInsets.only(top: _minimumPadding,bottom: _minimumPadding),
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: RaisedButton(
                      child: Text(
                        "Calculate"
                      ),
                      onPressed: (){

                      },
                    ),
                  ),

                  Container(width: _minimumPadding*5,),

                  Expanded(
                    child: RaisedButton(
                      child: Text(
                          "Reset"
                      ),
                      onPressed: (){

                      },
                    ),
                  )

                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(_minimumPadding),
              child: Text(
                  "To Do text"
              ),
            )

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

