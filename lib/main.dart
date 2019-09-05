import 'package:flutter/material.dart';
import 'screens/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ProductSans',
        primarySwatch: Colors.blue,
      ),
      home: BlogHome(),
      routes: BlogHome.buildRoutes()
    );
  }
}
