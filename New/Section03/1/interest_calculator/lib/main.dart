import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "This is the first app",
    home: ICal(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      accentColor: Colors.indigoAccent,
    ),
  ));
}

class ICal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ICalState();
  }
}

class _ICalState extends State<ICal> {
  var _formKey = GlobalKey<FormState>();
  var _currencies = ['Rupees', 'Pounds', 'Dollars'];
  final _minimumPadding = 5.0;
  var _currentSelectedItem = '';
  var displayResult = '';

  @override
  void initState() {
    super.initState();
    _currentSelectedItem = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text("Interest Calculator"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(_minimumPadding * 5),
                child: getImageAssets(),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: TextFormField(
                    controller: principalController,
                    style: textStyle,
                    // ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter the value";
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Principle",
                        labelStyle: textStyle,
                        errorStyle: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 15.0,
                        ),
                        hintText: "Enter Principle like eg:-5000",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: TextFormField(
                    controller: roiController,
                    // ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Enter the Rate of Interest";
                      }
                    },
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    decoration: InputDecoration(
                        labelText: "Rate of Interest",
                        labelStyle: textStyle,
                        errorStyle: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 15.0,
                        ),
                        hintText: "In percent",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextFormField(
                        controller: termController,
                        // ignore: missing_return
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Enter the term";
                          }
                        },
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        decoration: InputDecoration(
                            labelText: "Term",
                            labelStyle: textStyle,
                            hintText: "Time in years",
                            errorStyle: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 15.0,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                      Container(
                        width: _minimumPadding * 5,
                      ),
                      Expanded(
                          child: DropdownButton<String>(
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _currentSelectedItem,
                        onChanged: (String newValueSelected) {
                          _onItemSelected(newValueSelected);
                        },
                      ))
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text(
                          "Calculate",
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate()) {
                              this.displayResult = _calcTotal();
                            }
                          });
                        },
                      ),
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          "Reset",
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          _reset();
                        },
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(_minimumPadding),
                child: Text(
                  this.displayResult,
                  style: textStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getImageAssets() {
    AssetImage assetImage = AssetImage('images/cur.png');
    Image image = Image(
      width: 125.0,
      height: 125.0,
      image: assetImage,
    );

    return Container(
      child: image,
    );
  }

  void _onItemSelected(String selectedItem) {
    setState(() {
      this._currentSelectedItem = selectedItem;
    });
  }

  String _calcTotal() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmount = principal + (principal * roi * term) / 100;
    String result =
        "After $term years, your total payble amount is $totalAmount $_currentSelectedItem";
    return result;
  }

  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentSelectedItem = _currencies[0];
  }

}
