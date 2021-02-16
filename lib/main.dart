/*
 * Copyright (C) 2021 Swastik Nath.
 *
 *  Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 *
 *   1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 *
 *   2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 *
 *   3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 *
 *                            THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import 'package:anuranan_sahitya_app/ui/biometric_authenticate.dart';
import 'package:anuranan_sahitya_app/ui/home.dart';
import 'package:anuranan_sahitya_app/ui/phone_auth_page.dart';
import 'package:anuranan_sahitya_app/ui/signin.dart';
import 'package:anuranan_sahitya_app/ui/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'ui/registration.dart';
import 'ui/splashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(LauncherPage());
}

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  bool _initialized = false;
  bool _error = false;
  FirebaseAuth auth;

  Future<void> initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
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

    if (_error) {
      return ErrorLoad();
    }

    if (!_initialized) return LoadingInitialization();

    setState(() {
      auth = FirebaseAuth.instance;
    });
    return MaterialApp(
        home: SplashScreen(firebaseAuth: auth),
        routes: {
          '/registration': (context) => RegistrationPage(),
          '/signin': (context) => SigninPage(
                auth: auth,
              ),
          '/signup': (context) => SignupPage(),
          '/home': (context) => HomePage(
                fAuth: auth,
              ),
          '/auth': (context) => BiometricPage(),
          '/phone': (context) => PhoneAuthPage(),
        },
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity));
  }
}

class ErrorLoad extends StatefulWidget {
  @override
  _ErrorLoadState createState() => _ErrorLoadState();
}

class _ErrorLoadState extends State<ErrorLoad> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/error_art.json',
              height: MediaQuery.of(context).size.height / 2.0,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: 20),
            Text(
              "Ow! Snap",
              textAlign: TextAlign.center,
              style: GoogleFonts.titilliumWeb(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  letterSpacing: 2.0),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Would you be kind enough to check your Internet Connection? Anuranan Needs internet to Connect with its servers.",
                  style: GoogleFonts.titilliumWeb(
                    color: Colors.grey,
                    letterSpacing: 2.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Text(
              "Error Code: 0X12",
              style: TextStyle(
                fontFamily: "Jetbrains Mono",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        )
      ],
    );
  }
}

class LoadingInitialization extends StatefulWidget {
  @override
  _LoadingInitializationState createState() => _LoadingInitializationState();
}

class _LoadingInitializationState extends State<LoadingInitialization> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Lottie.asset(
          'assets/init_loading.json',
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
