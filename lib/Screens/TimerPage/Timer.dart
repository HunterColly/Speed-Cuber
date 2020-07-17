import 'dart:async';
import 'package:SpeedCuber/classes/dependencies.dart';
import 'package:SpeedCuber/widgets/timer_clock.dart';
import 'package:flutter/material.dart';

class MainScreenPortrait extends StatefulWidget {
  final Dependencies dependencies;

  MainScreenPortrait({Key key, this.dependencies}) : super(key: key);

  MainScreenPortraitState createState() => MainScreenPortraitState();
}

class MainScreenPortraitState extends State<MainScreenPortrait> {
  Icon leftButtonIcon;
  Icon rightButtonIcon;

  Color leftButtonColor;
  Color rightButtonColor;

  Timer timer;

  updateTime(Timer timer) {
    if (widget.dependencies.stopwatch.isRunning) {
      setState(() {});
    } else {
      timer.cancel();
    }
  }

  @override
  void initState() {
    if (widget.dependencies.stopwatch.isRunning) {
      timer = new Timer.periodic(new Duration(milliseconds: 20), updateTime);
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
        Container(
          child: TimerClock(widget.dependencies),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.dependencies.savedTimeList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                      alignment: Alignment.center,
                      child: Text(
                        createListItemText(
                            widget.dependencies.savedTimeList.length,
                            index,
                            widget.dependencies.savedTimeList.elementAt(index)),
                        style: TextStyle(fontSize: 24.0),
                      )),
                );
              }),
        ),
        //Text('$savedTimeList')
      ],
    );
  }

  startOrStopWatch() {
    if (widget.dependencies.stopwatch.isRunning) {
            leftButtonIcon = Icon(Icons.play_arrow);
      leftButtonColor = Colors.green;
      rightButtonIcon = Icon(Icons.refresh);
      rightButtonColor = Colors.blue;
      widget.dependencies.stopwatch.stop();
              widget.dependencies.savedTimeList.insert(
            0,
            widget.dependencies.transformMilliSecondsToString(
                widget.dependencies.stopwatch.elapsedMilliseconds));
      setState(() {});
    } else {
            leftButtonIcon = Icon(Icons.pause);
      leftButtonColor = Colors.red;
      rightButtonIcon = Icon(
        Icons.fiber_manual_record,
        color: Colors.red,
      );
      rightButtonColor = Colors.white70;
      widget.dependencies.stopwatch.start();
      timer = new Timer.periodic(new Duration(milliseconds: 20), updateTime);
      widget.dependencies.stopwatch.reset();
    }
  }

  String createListItemText(int listSize, int index, String time) {
    index = listSize - index;
    return '$time';
  }
}