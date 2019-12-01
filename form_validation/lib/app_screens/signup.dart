import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget{
  SignUpPage({Key key}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    return _StateSignUpPage();
  }
}

class _StateSignUpPage extends State<SignUpPage>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate=false;
  String _name;
  String _email;
  String _mobile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: FormUI(),
          ),
        ),
      ),
    );
  }
  Widget FormUI(){
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            labelText: "Name"
          ),
          keyboardType: TextInputType.text,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Mobile"
          ),
          keyboardType: TextInputType.text,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Email"
          ),
          keyboardType: TextInputType.text,
        ),
        SizedBox(
          height: 10.0,
        ),
        RaisedButton(
          onPressed: _validateInputs,
          child: Text('Validate'),
        )
      ],
    );
  }

  void _validateInputs(){
    
  }
}