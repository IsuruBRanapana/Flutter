import 'package:flutter/material.dart';
import 'package:bottom_navigation_testing/app_screens/first_screen.dart' as first;
import 'package:bottom_navigation_testing/app_screens/second_screen.dart' as second;
import 'package:bottom_navigation_testing/app_screens/third_screen.dart' as third;
import 'package:bottom_navigation_testing/app_screens/fourth_screen.dart' as fourth;
import 'package:bottom_navigation_testing/app_screens/fifth_screen.dart' as fifth;


class MyTabs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyTabsState();
  }
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin{

  TabController controller;
  @override
  void initState(){
    super.initState();
    controller=TabController(vsync: this,length: 5);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Bottom Navigation'
        ),
        /*bottom: TabBar(
          controller: controller,
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.access_alarms),
            ),
            Tab(
              icon: Icon(Icons.backup),
            ),
            Tab(
              icon: Icon(Icons.cake),
            ),
            Tab(
              icon: Icon(Icons.dashboard),
            ),
            Tab(
              icon: Icon(Icons.edit),
            )
          ],
        ),*/
      ),
      bottomNavigationBar: 
      Material(
        color: Colors.deepOrange,
        child: TabBar(
          controller: controller,
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.access_alarms),
            ),
            Tab(
              icon: Icon(Icons.backup),
            ),
            Tab(
              icon: Icon(Icons.cake),
            ),
            Tab(
              icon: Icon(Icons.dashboard),
            ),
            Tab(
              icon: Icon(Icons.edit),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          first.FirstScreen(),
          second.SecondScreen(),
          third.ThirdScreen(),
          fourth.FourthScreen(),
          fifth.FifthScreen()
        ],
      ),
    );
  }
}

