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

import 'dart:async';
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:anuranan_sahitya_app/utils/PageNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_auth_invisible/flutter_local_auth_invisible.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class BiometricPage extends StatefulWidget {
  @override
  _BiometricPageState createState() => _BiometricPageState();
  IconData biometricStatusID = FontAwesomeIcons.fingerprint;

  BiometricPage({this.biometricStatusID});
}

class _BiometricPageState extends State<BiometricPage> {
  bool authenticated = false;
  final LocalAuthentication auth = LocalAuthentication();
  bool _permitBiometric = false;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  List<String> fingerAssets = [
    'assets/FingerPrint.json',
    'assets/success.json',
    'assets/error_auth.json'
  ];
  List<String> messageAssets = [
    "Touch the Fingerprint Sensor to Authenticate.",
    "Authentication Success! Please Wait...",
    "Authentication Error - Wrong Fingerprint Limit Reached."
  ];
  int initAssetPoint = 0;

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return null;
    setState(() {
      _permitBiometric = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      _availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
        localizedReason: "Anuranan Secured requires your Biometrics to proceed",
        stickyAuth: true,
        useErrorDialogs: false,
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authorized';
      });
    } on PlatformException catch (e) {
      setState(() {
        initAssetPoint = 2;
      });

      print(e);
    }
    if (!mounted) return;
    if (authenticated) {
      setState(() {
        initAssetPoint = 1;
      });
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
    authenticated
        ? Timer(Duration(seconds: 3), () => PageNav.sentToHome(context))
        : _authenticate();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      initAssetPoint = 0;
    });
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => _authenticate());
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure to Exit?'),
            content: Text(
                'Anuranan App will be closed, make sure to save any unsaved content.'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () => exit(0),
                /*Navigator.of(context).pop(true)*/
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    // _authenticate();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Stack(
        children: [
          SafeArea(
            child: Scaffold(
                body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xff0f2027),
                Color(0xff203A43),
                Color(0xff2C5364)
              ])),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        ColorizeAnimatedTextKit(
                          repeatForever: true,
                          text: [
                            "Anuranan Secured",
                            "Your Privacy, Prioritized."
                          ],
                          textStyle: GoogleFonts.josefinSans(
                              fontSize: 30,
                              letterSpacing: 2.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              decorationStyle: TextDecorationStyle.dashed),
                          colors: [
                            Colors.yellowAccent,
                            Colors.pinkAccent,
                            Colors.white,
                            Colors.lightBlueAccent
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Anuranan Secured keeps all your data on your device safe which can be unlocked with Registered Biometrics only.",
                            style: GoogleFonts.josefinSans(
                                letterSpacing: 1.5, color: Colors.white),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: Center(
                            child: Text(
                              messageAssets[initAssetPoint],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.josefinSans(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _authenticate();
                            if (authenticated) {
                              initAssetPoint = 1;
                            }
                          },
                          child: Lottie.asset(
                            fingerAssets[initAssetPoint],
                            height: MediaQuery.of(context).size.height / 4.0,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Anuranan App doesn't obtain your biometrics from your device. It integrates with the System Security"
                            " to authenticate users locally. ",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.titilliumWeb(
                                fontSize: 9.0,
                                letterSpacing: 2.0,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: Center(
                            child: Text(
                              "Anuranan Secured v1.0",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.josefinSans(
                                fontSize: 15.0,
                                letterSpacing: 1.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}
