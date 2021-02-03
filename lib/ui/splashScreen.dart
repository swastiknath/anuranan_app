import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:anuranan_sahitya_app/utils/PageNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 11), () => PageNav.sendToRegister(context));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/welcome_background.png"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(milliseconds: 800),
                  child: Center(
                    child: Image.asset('images/main_logo.png'),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    SpinKitFadingCube(
                      color: Colors.blue[200],
                      size: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TypewriterAnimatedTextKit(
                        speed: Duration(milliseconds: 60),
                        repeatForever: true,
                        text: [
                          "Initializing...",
                          "Establishing Connection...",
                          "Decrypting Information...",
                          "Evaluating Accounts..."
                        ],
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            letterSpacing: 4.0,
                            fontFamily: "Jetbrains Mono"),
                        textAlign: TextAlign.start),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
