import 'package:flutter/material.dart';

class Option {
  Icon icon;
  String title;
  String subtitle;

  Option({this.icon, this.title, this.subtitle});
}

final options = [
  Option(
    icon: Icon(Icons.settings, size: 40.0, color: Colors.black),
    title: 'Settings',
    subtitle: 'Configure the app settings...',
  ),
  Option(
    icon: Icon(Icons.format_paint, size: 40.0, color: Colors.yellow),
    title: 'Colour scheme',
    subtitle: 'Change the cubes look...',
  ),
  Option(
    icon: Icon(Icons.palette, size: 40.0, color: Colors.orange),
    title: 'App theme',
    subtitle: 'Change the look of the app...',
  ),
  Option(
    icon: Icon(Icons.attach_money, size: 40.0, color: Colors.green),
    title: 'Donate',
    subtitle: 'Help support my first ever app...',

  ),
  Option(
    icon: Icon(Icons.help, size: 40.0, color: Colors.blue),
    title: 'Help',
    subtitle: 'Need help?',
  ),
  Option(
    icon: Icon(Icons.bookmark, size: 40.0, color: Colors.purple),
    title: 'About & feedback',
    subtitle: 'About the app, and contacting me...',
  ),
];