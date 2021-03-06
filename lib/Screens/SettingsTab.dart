import 'dart:ui';
import 'package:flutter/material.dart';

void main() => runApp(SettingsTab());
  
class SettingsTab extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Settings",
      darkTheme: ThemeData.dark(

      ),

      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget ({Key key}) : super (key:key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State <MyStatefulWidget> {
  Widget build (BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text('This Page Is In Development!',
          style: TextStyle(color: Colors.white)
        ),
      ),
      ),
    );
  }
}