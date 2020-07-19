
import 'package:flutter/material.dart';
import 'package:SpeedCuber/Screens/TimerPage/Timer.dart';
import 'package:SpeedCuber/Screens/TimerPage/Times.dart';

class TimerMain extends StatefulWidget {

  TimerMain({Key key}) : super(key: key);

  @override
  _TimerMainState createState() => _TimerMainState();
}

class _TimerMainState extends State<TimerMain> {
  var _pages = [
  MainScreenPortrait(), 
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
