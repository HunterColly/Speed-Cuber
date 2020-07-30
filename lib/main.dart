import 'package:SpeedCuber/Screens/Home.dart';
import 'package:SpeedCuber/Screens/Profile.dart';
import 'package:SpeedCuber/Screens/Progress.dart';
import 'package:SpeedCuber/Screens/SettingsTab.dart';
import 'package:SpeedCuber/Screens/TimerPage/Timer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpeedCuber',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'SpeedCuber'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int _page = 1;

  final _pageOption = [
    SettingsTab(),
    TimerPage(),
    HomePage(),
    Progress(),
    Profile(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.white,
          backgroundColor: Colors.black87,
          buttonBackgroundColor: Colors.white,
          height: 50,
          animationDuration: Duration(
            milliseconds: 400
          ),
            animationCurve: Curves.easeInOut,
            items: <Widget> [
              Icon(Icons.settings, size: 25, color: Colors.black),
              Icon(Icons.timer, size: 25, color: Colors.black),
              Icon(Icons.home, size: 25, color: Colors.black),
              Icon(Icons.list, size: 25, color: Colors.black),
              Icon(Icons.person, size: 25, color: Colors.black),
              ],
              index: 1,
              onTap: (index) {
                setState(() {
                  _page = index;
              },
            );
          },
        ),
        body: _pageOption[_page],
      ),
    );
  }
}
