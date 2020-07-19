
import 'package:flutter/material.dart';
import 'package:SpeedCuber/Screens/TimerPage/Timer.dart';
import 'package:SpeedCuber/Screens/TimerPage/Times.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerMain extends StatefulWidget {

  TimerMain({Key key}) : super(key: key);

  @override
  _TimerMainState createState() => _TimerMainState();
}

class _TimerMainState extends State<TimerMain> {
  var _pages = [
  MainScreenPortrait(), 
  TimesPage()
  ];
  var _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _pages,
        onPageChanged: (index) {
          setState(() {
          });
        },
        controller: _pageController,
      ),
    );
  }
}
