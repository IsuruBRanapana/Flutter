import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Firebase Test',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){

            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Isuru Ranapana'
              ),
              accountEmail: Text(
                'raaisurub.ranapana@gmail.com'
              ),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
            ListTile(
              title: Text(
                'First Page'
              ),
              leading: Icon(
                Icons.search,
                color: Colors.green,
              )
            ),
            ListTile(
                title: Text(
                    'Second Page'
                ),
                leading: Icon(
                  Icons.add,
                  color: Colors.purple,
                )
            ),
            ListTile(
                title: Text(
                    'Third Page'
                ),
                leading: Icon(
                  Icons.cake,
                  color: Colors.pink,
                )
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