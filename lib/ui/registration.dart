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

import 'dart:io';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:anuranan_sahitya_app/constants/strings.dart';
import 'package:anuranan_sahitya_app/ui/signin.dart';
import 'package:anuranan_sahitya_app/ui/signup.dart';
import 'package:anuranan_sahitya_app/utils/PageNav.dart';
import 'package:anuranan_sahitya_app/widgets/InfoCards.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
  FirebaseAuth fAuth;
}

class _RegistrationPageState extends State<RegistrationPage> {
  List<Widget> onboardingSlides = [
    InfoCards(
      iconName: 'images/intro_landing1.jpg',
      header: packagedStrings.introHeader1,
      description: packagedStrings.introDesc1,
    ),
    InfoCards(
      iconName: 'images/intro_landing2.jpg',
      header: packagedStrings.introHeader2,
      description: packagedStrings.introDesc2,
    ),
    InfoCards(
      iconName: 'images/intro_landing3.jpg',
      header: packagedStrings.intoHeader3,
      description: packagedStrings.introDesc3,
    ),
  ];

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
    return WillPopScope(
      onWillPop: _onWillPop,
      child: MaterialApp(
        routes: {
          '/signin': (context) => SigninPage(),
          '/signup': (context) => SignupPage()
        },
        home: SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/registration_page.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 85,
                            width: 350,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 30.0, left: 10),
                              child: Text(
                                "Welcome to ",
                                style: GoogleFonts.titilliumWeb(
                                  fontSize: 45,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 85,
                            width: 250,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: RotateAnimatedTextKit(
                                text: ["Anuranan Family!", "A New Revolution!"],
                                repeatForever: true,
                                textStyle: GoogleFonts.josefinSans(
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.pink),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // InfoCards(),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height / 2.0,
                          autoPlay: true,
                          viewportFraction: 1.0,
                          aspectRatio: 2.0,
                          autoPlayCurve: Curves.easeInCubic,
                          enlargeCenterPage: true,
                        ),
                        items: onboardingSlides,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 16.0,
                                  top: 8.0,
                                  right: 16.0,
                                  bottom: 0.0),
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                color: Colors.grey.withOpacity(0.1),
                                onPressed: () {
                                  PageNav.sendToSignIn(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    "Register for an Anuranan Account",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 16.0,
                                  top: 8.0,
                                  right: 16.0,
                                  bottom: 0.0),
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                color: Colors.grey.withOpacity(0.1),
                                onPressed: () {
                                  PageNav.sendToSignIn(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    "Sign in to your Anranan Account    ",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Anuranan Respects your Privacy with utmost Care. "
                          "Neither any personally identifiable data is stored on the Server nor these can be accessed even by us at any means."
                          "Your Published Articles will be subjected to review for potential plagiarism and might be removed if it goes against our Community Guidelines.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.comfortaa(
                              color: Colors.white, fontSize: 8.0),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
