import 'package:flutter/material.dart';
import 'package:todo/home.dart';

void main() {
  runApp( MaterialApp(
    theme: ThemeData(
      useMaterial3: false
    ),
    home: Home(),
  ));
}


