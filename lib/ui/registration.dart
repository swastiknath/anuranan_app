import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:anuranan_sahitya_app/widgets/InfoCards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Stack(children: [
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
            Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 85,
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 10),
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
                InfoCards()
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
