import 'package:flutter/material.dart';
import 'package:live/LoginPage.dart';
import 'package:live/access/guide_page.dart';
import 'package:live/live/LivePage.dart';
import 'package:live/homePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
        bottomAppBarColor: Colors.blue,
        accentColor: Colors.cyan[600],
      ),
      home: new GuidePage(),
      routes: <String, WidgetBuilder>{
        '/LoginPage': (BuildContext context) => new LoginPage()
      },
    );
  }
}
