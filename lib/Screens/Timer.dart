import 'dart:async';
import 'dart:convert';
import 'package:SpeedCuber/classes/dependencies.dart';
import 'package:SpeedCuber/classes/times_Alert.dart';
import 'package:SpeedCuber/main.dart';
import 'package:SpeedCuber/widgets/timer_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grid_delegate_ext/rendering/grid_delegate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() {
  SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class TimerPage extends StatefulWidget {
  TimerPage({Key key}) : super(key: key);

  TimerPageState createState() => TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  final Dependencies dependencies = new Dependencies();
  List<Dependencies> list = new List<Dependencies>();
  SharedPreferences sharedPreferences;
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
    } else {}
    loadSharedPreferencesAndData();
    super.initState();
  }
  
  void loadSharedPreferencesAndData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
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
            onTap: () => startOrStopWatch(),
            onTapDown: (TapDownDetails details){
            setState(() {
              onTapDownWatch();
            });
            },
            child: new Container(
              child: TimerClock(dependencies),
              height: 1000,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget _scrollingList(ScrollController sc) {
    new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
        ),
      ],
    );
    return new GridView.builder(
      padding: EdgeInsets.fromLTRB(15, 30, 15, 15),
      gridDelegate: XSliverGridDelegate(
          crossAxisCount: 3,
          smallCellExtent: 60,
          bigCellExtent: 60,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      shrinkWrap: false,
      controller: sc,
      itemCount: dependencies.savedTime?.length ?? 0,
      itemBuilder: (context, index) {
        return GridTile(
          child: new GestureDetector(
            onTap: () => TimesAlert(),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    color: Colors.black12),
                alignment: Alignment.center,
                child: Text(
                  createListItemText(dependencies.savedTime.length, index,
                      dependencies.savedTime.elementAt(index)),
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00FFFF)),
                )),
          ),
        );
      },
    );
  }

  startOrStopWatch() {
    if (dependencies.stopwatch.isRunning) {
      dependencies.stopwatch.stop();
      dependencies.savedTime.insert(
          0,
          dependencies.transformMilliSecondsToString(
              dependencies.stopwatch.elapsedMilliseconds));
      setState(() {});
    } else {
      dependencies.stopwatch.start();
      timer = new Timer.periodic(new Duration(milliseconds: 20), updateTime);
      dependencies.stopwatch.reset();
      saveData();
    }
  }

  onTapDownWatch() {
    if (dependencies.stopwatch.isRunning) {
    } else {
      dependencies.stopwatch.reset();
    }
  }

  String createListItemText(int listSize, int index, String time) {
    index = listSize - index;
    return '$time';
  }

  void loadData() {
    List<String> listString = sharedPreferences.getStringList('list');
    if(listString != null){
      list = listString.map(
        (item) => Dependencies.fromMap(json.decode(item))
      ).toList();
      setState((){});
    }
  }

  void saveData(){
    List<String> stringList = list.map(
      (item) => json.encode(item.toMap()
    )).toList();
    print(stringList);
  }
}
