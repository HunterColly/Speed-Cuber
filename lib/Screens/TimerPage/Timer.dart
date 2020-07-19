import 'dart:async';
import 'package:SpeedCuber/classes/curent_time.dart';
import 'package:SpeedCuber/widgets/timer_clock.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dependencies {
  final Stopwatch stopwatch = new Stopwatch();

  final List<String> savedTimeList = List<String>();

  transformMilliSecondsToString(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString();
    String minutesStr = (minutes % 60).toString();

    return '$minutesStr : $secondsStr.$hundredsStr';
  }

  transformMilliSecondsToTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    return CurrentTime(
        hundreds: hundreds % 100,
        seconds: seconds % 60,
        minutes: minutes % 60,);
  }
}


class MainScreenPortrait extends StatefulWidget {

  MainScreenPortrait({Key key}) : super(key: key);

  MainScreenPortraitState createState() => MainScreenPortraitState();
}

class MainScreenPortraitState extends State<MainScreenPortrait> {
  final Dependencies dependencies = new Dependencies();

  Icon leftButtonIcon;
  Icon rightButtonIcon;

  Color leftButtonColor;
  Color rightButtonColor;

  Timer timer;

  updateTime(Timer timer) {
    if (dependencies.stopwatch.isRunning) {
      setState(() {});
    } else {
      timer.cancel();
    }
  }

  @override
  void initState() {
    if (dependencies.stopwatch.isRunning) {
      timer = new Timer.periodic(new Duration(milliseconds: 1), updateTime);
            leftButtonIcon = Icon(Icons.pause);
      leftButtonColor = Colors.red;
      rightButtonIcon = Icon(
        Icons.fiber_manual_record,
        color: Colors.red,
      );
      rightButtonColor = Colors.white70;
    } else {
      leftButtonIcon = Icon(Icons.play_arrow);
      leftButtonColor = Colors.green;
      rightButtonIcon = Icon(Icons.refresh);
      rightButtonColor = Colors.blue;
    }
    super.initState();
  }

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel();
      timer = null;
    }
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new GestureDetector(
          onTap: ()=> startOrStopWatch(),
          child: new Container(
          child: TimerClock(dependencies),
          height: 700,
          color: Colors.black,
        ),),
                Expanded(
          child: ListView.builder(
              itemCount: dependencies.savedTimeList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                      height: 40,
                      alignment: Alignment.center,

                      child: Text(
                        createListItemText(
                            dependencies.savedTimeList.length,
                            index,
                            dependencies.savedTimeList.elementAt(index)),
                        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                      )),
                );
              }),
        ),
      ],
    );
  }

  startOrStopWatch() {
    if (dependencies.stopwatch.isRunning) {
      dependencies.stopwatch.stop();
              dependencies.savedTimeList.insert(
            0,
            dependencies.transformMilliSecondsToString(
                dependencies.stopwatch.elapsedMilliseconds));
      setState(() {});
    } else {
      dependencies.stopwatch.start();
      timer = new Timer.periodic(new Duration(milliseconds: 1), updateTime);
      dependencies.stopwatch.reset();
    }
  }

  String createListItemText(int listSize, int index, String time) {
    index = listSize - index;
    return '$time';
  }

}