import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/welcome/welcome.dart';
import 'package:my_flutter_app/routes.dart';

import 'global.dart';

// void main() {
//   runApp(MyApp());
// }
void main() => Global.init().then((value) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter News',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: staticRoutes,
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
    );
  }
}
