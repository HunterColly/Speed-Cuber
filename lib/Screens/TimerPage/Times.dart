import 'package:SpeedCuber/Screens/TimerPage/Timer.dart';
import 'package:flutter/material.dart';

class TimesPage extends StatefulWidget {

  TimesPage({Key key}) : super(key: key);

  @override
  _TimesPageState createState() => _TimesPageState();
}

class _TimesPageState extends State <TimesPage> {
final Dependencies dependencies = new Dependencies();

@override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: dependencies.savedTimeList.length,
              itemBuilder: (context, index) =>
              Text(createListItemText(
                            dependencies.savedTimeList.length,
                            index,
                            dependencies.savedTimeList.elementAt(index)),
                        style: TextStyle(fontSize: 24.0),)
              ),
        ),
        //Text('$savedTimeList')
      ],
    );
  }
}

  String createListItemText(int listSize, int index, String time) {
    index = listSize - index;
    return '$time';
  }