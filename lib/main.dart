import 'package:flutter/material.dart';
import 'package:weather_time_app/pages/home.dart';
import 'package:weather_time_app/pages/loading.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.teal,
      ),
      home: Loading(),
    );
  }
}
