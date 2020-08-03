import 'dart:async';
import 'package:SpeedCuber/classes/curent_time.dart';
import 'package:SpeedCuber/widgets/timer_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_delegate_ext/rendering/grid_delegate.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/src/painting/box_border.dart';

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


class TimerPage extends StatefulWidget {

  TimerPage({Key key}) : super(key: key);

  TimerPageState createState() => TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  final Dependencies dependencies = new Dependencies();
  TimerClock timerClock;
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
      timer = new Timer.periodic(new Duration(milliseconds: 20), updateTime);
    } else {
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
    return Scaffold(
      body: SlidingUpPanel(
        borderRadius: BorderRadius.only(
      topLeft: const Radius.circular(30.0),
      topRight: const Radius.circular(30.0),
    ),
        color: Colors.black12,
        backdropOpacity: 1.0,
        backdropEnabled: true,
        parallaxEnabled: true,
        parallaxOffset: .5,
        panelBuilder: (sc) => _scrollingList(sc),
        body: Center(
          child: new GestureDetector(
              onTap: ()=> startOrStopWatch(),
              child: new Container(
              child: TimerClock(dependencies),
              height: 1000,
              color: Colors.black87,
            ),),
            ),
        ),
    );
  }

  Widget _scrollingList(ScrollController sc){
    new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(12.0))
                ),
              ),
            ],
          );
      return new GridView.builder(
        padding: EdgeInsets.fromLTRB(15,30,15,15),
          gridDelegate: XSliverGridDelegate(
              crossAxisCount: 3,
              smallCellExtent: 60,
              bigCellExtent: 60,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
              shrinkWrap: false,
      controller: sc,
      itemCount: dependencies.savedTimeList.length,
      itemBuilder: (context, index) {
        return GridTile(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              color: Colors.black12
            ),
          alignment: Alignment.center,
            child: Text(
              createListItemText(
                dependencies.savedTimeList.length,
                index,
                dependencies.savedTimeList.elementAt(index)),
                  style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                color: Color(0xFF00FFFF) 
              ),
            )
          ),
        );
      },
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
      timer = new Timer.periodic(new Duration(milliseconds: 20), updateTime);
      dependencies.stopwatch.reset();
    }
  }

  String createListItemText(int listSize, int index, String time) {
    index = listSize - index;
    return '$time';
  }

}