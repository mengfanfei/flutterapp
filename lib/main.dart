import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/welcome/welcome.dart';
import 'package:my_flutter_app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: staticRoutes,
        home: WelcomePage());
  }
}
