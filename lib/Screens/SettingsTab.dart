import 'package:flutter/material.dart';
import 'package:SpeedCuber/Modals/option_model.dart';

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

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedOption = 0;

  var alignment;

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
          body: ListView.builder(
            itemCount: options.length + 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return SizedBox(height: 50.0);
            } else if (index == options.length + 1) {
                return SizedBox(height: 100.0);
              }
            return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Color(0xFF0373F7).withOpacity(.44), offset: Offset(3.0, 3.0,), blurRadius: 15)],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                child: ListTile(
                    leading: options[index - 1].icon,
                    title: Text(
                      options[index - 1].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _selectedOption == index - 1
                            ? Colors.black
                            : Colors.black,
                      ),
                    ),
                  subtitle: Text(
                    options[index - 1].subtitle,
                    style: TextStyle(
                      color:
                          _selectedOption == index - 1 ? Colors.black : Colors.black,
                    ),
                  ),
                  selected: _selectedOption == index - 1,
                  onTap: () {
                    setState(() {
                   _selectedOption = index - 1;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}