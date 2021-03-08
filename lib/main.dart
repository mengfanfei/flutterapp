import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      designSize: Size(375, 812),
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: 'Flutter News',
        routes: staticRoutes,
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
      ),
    );
  }
}
