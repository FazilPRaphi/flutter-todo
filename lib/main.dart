import 'package:flutter/material.dart';
import 'package:todo/home.dart';
import 'package:todo/models/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>("todos");
  runApp( MaterialApp(
    theme: ThemeData(
      useMaterial3: false
    ),
    home: Home(),
  ));
}


