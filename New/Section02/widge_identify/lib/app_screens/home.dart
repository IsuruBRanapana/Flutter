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
        air("Emirates", "US to Sri Lanka")
      ],
    );
  }

}

