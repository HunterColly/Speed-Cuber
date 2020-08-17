import 'package:SpeedCuber/classes/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:SpeedCuber/classes/curent_time.dart';

class TimerClock extends StatefulWidget {
  final Dependencies dependencies;

  TimerClock(this.dependencies, {Key key}) : super(key: key);

  TimerClockState createState() => TimerClockState();
}

class TimerClockState extends State<TimerClock> {
  CurrentTime currentTime;
  TextStyle timerText;
  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentTime = widget.dependencies.transformMilliSecondsToTime(
        widget.dependencies.stopwatch.elapsedMilliseconds);

    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (currentTime.minutes > 0)
          new Container(
            child: new SizedBox(
              height: 100.0,
              child: new Text(
                '${currentTime.minutes.toString()}:',
                style: TextStyle(
                    fontSize: 90.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00FFFF)),
              ),
            ),
          ),
        if (currentTime.minutes == 0)
          new Container(
            child: new SizedBox(
              height: 100.0,
              child: new Text(
                '${currentTime.seconds.toString()}.',
                style: TextStyle(
                    fontSize: 90.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00FFFF)),
              ),
            ),
          ),
        if (currentTime.minutes > 0)
          new Container(
            child: new SizedBox(
              height: 100.0,
              child: new Text(
                '${currentTime.seconds.toString().padLeft(2, '0')}.',
                style: TextStyle(
                    fontSize: 90.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00FFFF)),
              ),
            ),
          ),
        new Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: new SizedBox(
            height: 80.0,
            child: new Text(
              currentTime.hundreds.toString().padLeft(2, '0'),
              style: TextStyle(
                  fontSize: 70.0,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00FFFF)),
            ),
          ),
        ),
      ],
    );
  }
}