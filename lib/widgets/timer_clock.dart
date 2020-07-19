import 'package:SpeedCuber/Screens/TimerPage/Timer.dart';
import 'package:flutter/material.dart';
import 'package:SpeedCuber/classes/curent_time.dart';

class TimerClock extends StatefulWidget {
  final Dependencies dependencies;

  TimerClock(this.dependencies, {Key key}) : super(key: key);

  TimerClockState createState() => TimerClockState();
}

class TimerClockState extends State<TimerClock> {
  CurrentTime currentTime;

  Paint paint;

  @override
  void initState() {
    paint = new Paint();
    super.initState();
  }

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
          new Container(
            child: new SizedBox(
              height: 100.0,
              child: new Text(
              '${currentTime.minutes.toString()}:',
              style: TextStyle(fontSize: 90.0, fontFamily: 'Quicksand', fontWeight: FontWeight.bold, color: Color(0xFF00FFFF),),
            ),
            ),
          ),
          new Container(
            child: new SizedBox(
              height: 100.0,
              child: new Text(
              '${currentTime.seconds.toString()}.',
              style: TextStyle(fontSize: 90.0, fontFamily: 'Quicksand', fontWeight: FontWeight.bold, color: Color(0xFF00FFFF),),),
            ),
          ),
          new Container(
            child: new SizedBox(
              height: 80.0,
              child: new Text(
              currentTime.hundreds.toString().padLeft(2, '0'),
              style: TextStyle(fontSize: 75.0, fontFamily: 'Quicksand', fontWeight: FontWeight.bold, color: Color(0xFF00FFFF),),),
            ),
          ),
      ],
    );
  }
}
