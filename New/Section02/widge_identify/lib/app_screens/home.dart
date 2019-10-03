import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        color: Colors.lightBlue[900],
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.only(left: 4.0,right: 4.0,top: 10.0),
        //width: 200.0,
        //height: 500.0,
        child: airTable()
      ),
    );
  }

  air(String airline, String place){
    return Row(
      children: <Widget>[
        Expanded(child:
          Text(
            airline,
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 36,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                backgroundColor: Colors.lightBlue[800]
            ),
          )
        ),
        Expanded(child:
          Text(
            place,
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none,
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w300,
                backgroundColor: Colors.lightBlue[800]
            ),
          )
        ),
      ],
    );
  }

  airTable(){
    return Column(
      children: <Widget>[
        air("Sri Lankan", "Sri Lanka to German"),
        air("Oman Air", "Sri Lanka to Oman"),
        air("Emirates", "US to Sri Lanka"),
        AirImageAssets(),
        AirBookingButton()
      ],
    );
  }
}

class AirImageAssets extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage=AssetImage('images/volkswagen.png');
    Image image=Image(image: assetImage,
      width: 100.0,
      height: 100.0,
    );
    return Container(
      child:image,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(3.0),
    );
  }
}


class AirBookingButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 50.0,
      margin: EdgeInsets.all(20.0),
     // padding: EdgeInsets.all(10.0),
      child: RaisedButton(
        child: Text(
          "Book Your Flight",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w700
          ),
        ),
        color: Colors.amber[900],
        elevation: 6.0,
        onPressed: (){
          airBook(context);
        },
      ),
    );
  }

  void airBook(BuildContext context){
    var alertDialog = AlertDialog(
      title: Text("Successful"),
      content: Text("Safe flight"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }
}

