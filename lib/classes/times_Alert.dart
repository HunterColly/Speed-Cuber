import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TimesAlert extends StatefulWidget {

  TimesAlert({Key key}) : super(key: key);

  TimesAlertState createState() => TimesAlertState();
}

class TimesAlertState extends State<TimesAlert> {

  @override
  Widget build(BuildContext context) {
      new Alert(
              context: context,
              style: AlertStyle(
                backgroundColor: Colors.black26,
                alertBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Colors.white,
                    )),
                titleStyle: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00FFFF)),
                descStyle: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Quicksand',
                    color: Color(0xFF00FFFF)),
              ),
              type: AlertType.error,
              title: "DELETE!",
              desc: "Would you like to delete this time.",
              buttons: [
                DialogButton(
                  child: Text(
                    "YES",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00FFFF)),
                  ),
                  onPressed: () => {},
                  color: Colors.white10,
                ),
              ],
            ).show();
  }
}