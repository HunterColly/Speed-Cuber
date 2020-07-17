import 'package:SpeedCuber/classes/dependencies.dart';
import 'package:flutter/material.dart';

void main() => runApp(Times());

class Times extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile",
      darkTheme: ThemeData.dark(

      ),

      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final Dependencies dependencies;

  MyStatefulWidget ({Key key, this.dependencies}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State <MyStatefulWidget> {
  Widget build (BuildContext context) {
      return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
      ),
    );
  }
}