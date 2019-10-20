import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditProfileState();
  }
}

class _EditProfileState extends State<EditProfile>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile'
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              //TODO add profile picture
              accountName: Text(
                'Account Name'
              ),
              accountEmail: Text(
                'Email'
              ),
            ),
            Divider(
              height: 10.0,
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                  'Close'
              ),
              trailing: Icon(
                Icons.close,
                color: Colors.red,
              ),
              onTap: (){
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}