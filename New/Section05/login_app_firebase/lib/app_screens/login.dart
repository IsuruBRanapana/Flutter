import 'package:flutter/material.dart';
import 'package:login_app_firebase/app_screens/signup.dart';
import 'package:login_app_firebase/app_screens/home.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  bool _isHiddenPw = true;
  bool _isHiddenCPw = true;

  void _visiblePw() {
    setState(() {
      _isHiddenPw = !_isHiddenPw;
      _isHiddenCPw = _isHiddenCPw;
    });
  }

  void _visibleCPw() {
    setState(() {
      _isHiddenPw = _isHiddenPw;
      _isHiddenCPw = !_isHiddenCPw;
    });
  }

  var _formKey = GlobalKey<FormState>();
  double _minimumPadding = 5.0;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          textDirection: TextDirection.ltr,
        ),
      ),
      body: signUpForm(),
    );
  }

  Widget signUpForm() {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Container(
      alignment: Alignment.center,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(
              right: _minimumPadding * 3,
              left: _minimumPadding * 3,
              top: _minimumPadding * 5),
          child: ListView(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                    top: _minimumPadding,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 300,
                    color: Colors.purple[600],
                  )),

              //E mail
              Padding(
                padding: EdgeInsets.only(bottom: _minimumPadding),
                child: TextFormField(
                  controller: emailController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter the E mail Address";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: textStyle,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    labelStyle: Theme.of(context).textTheme.body1,
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    hintText: "Johnperera@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),

              //Password
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  controller: passwordController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter the Password";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  style: textStyle,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: _visiblePw,
                      icon: _isHiddenPw
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    labelText: "Password",
                    labelStyle: Theme.of(context).textTheme.body1,
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  obscureText: _isHiddenPw,
                ),
              ),

              Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: GestureDetector(
                    child: Text(
                      "Forgot your Password?",
                      style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {},
                  )),

              RaisedButton(
                child: Text(
                  'Login',
                  textScaleFactor: 1.2,
                ),
                textColor: Colors.white,
                color: Color(0xFF9400D3),
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState.validate()) {
                      //TODO search valid user
                      //TODO Navigate to Home page
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Home())
                      );
                    }
                  });
                },
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "New Here ? ",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              //row for forget pw and signup
            ],
          ),
        ),
      ),
    );
  }
}
