import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/registration.dart';
import 'ui/splashScreen.dart';

void main() {
  runApp(LauncherPage());
}

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.blueGrey[600],
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/registration': (context) => RegistrationPage(),
      },
    );
  }
}
