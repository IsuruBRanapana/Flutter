import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _StateSignUpPage();
  }
}

class _StateSignUpPage extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
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

  Widget FormUI() {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(labelText: "Name"),
          validator: validateName,
          onSaved: (String val) {
            _name = val;
          },
          keyboardType: TextInputType.text,
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Mobile"),
          keyboardType: TextInputType.phone,
          validator: validateMobile,
          onSaved: (String val) {
            _mobile = val;
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: "Email"),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          onSaved: (String val){
            _email=val;
          },
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

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      //if all data are correct then save data to out variables
      _formKey.currentState.save();
    } else {
      //If all data are not valid then start auto validation
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String validateName(String value) {
    if (value.length < 3) {
      return 'Name must be more than 2 charactors';
    } else {
      return null;
    }
  }

  String validateMobile(String value) {
    if (value.length != 10) {
      return 'Mobile number must include 10 digits';
    } else {
      return null;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
