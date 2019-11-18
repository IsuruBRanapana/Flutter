import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newapp/auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth,this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType = FormType.login;
  bool validateAndSave() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId=await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('$userId');
        }else if(_formType==FormType.register){
          String userId=await widget.auth.createUserWithEmailAndPassword(_email,_password);
          print('$userId');
        }
        widget.onSignedIn(); 
      } catch (e) {
        print(e); 
      }
    }
  }

  void moveToRegister() {
    formkey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formkey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter log in'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildInputs() + submitButtons()),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email must Include' : null,
        onSaved: (value) => _email = value,
      ),
      TextFormField(
        decoration: InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Password must Include' : null,
        onSaved: (value) => _password = value,
      )
    ];
  }

  List<Widget> submitButtons() {
    if (_formType == FormType.login) {
      return [
        RaisedButton(
          onPressed: () {
            validateAndSubmit();
          },
          child: Text('Log in'),
        ),
        FlatButton(
          child: Text('Create an account'),
          onPressed: moveToRegister,
        )
      ];
    } else {
      return [
        RaisedButton(
          onPressed: () {
            validateAndSubmit();
          },
          child: Text('Create an Account'),
        ),
        FlatButton(
          child: Text('Have an account'),
          onPressed: moveToLogin,
        )
      ];
    }
  }
}
