import 'package:flutter/material.dart';

void main() => runApp(Progress());
  
class Progress extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Progress",

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