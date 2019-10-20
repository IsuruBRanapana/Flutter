import 'package:flutter/material.dart';
import 'package:login_app_firebase/app_screens/editprofile.dart';
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home'
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              //TODO connect Image for profile picture
              /*currentAccountPicture: ,*/
              accountEmail: Text(
                'Email'
              ),
              accountName: Text(
                'Name'
              ),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
            ListTile(
                title: Text(
                    'Edit Profile'
                ),
                leading: Icon(
                  Icons.edit,
                  color: Colors.red,
                ),
              onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>EditProfile())
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}