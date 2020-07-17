import 'package:flutter/material.dart';

void main() => runApp(Profile());
  
class Profile extends StatelessWidget {
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
  MyStatefulWidget ({Key key}) : super (key:key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State <MyStatefulWidget> {
  Widget build (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: 
            [Color(0xFF414C50), 
            Color(0xFF2D383C)]
            ),
          ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
        body: Center(
          child: Text('Profile')
        ),
      ),
    );
  }
}