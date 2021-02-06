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

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
  GlobalKey<SideMenuState> endSideMenuState;
  Key key;

  UserInfo({this.key, @required this.endSideMenuState});
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ListView(
        children: [
          Stack(
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaY: 20.0,
                    sigmaX: 20.0,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'images/intro_landing1.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your \nProfile",
                          style: GoogleFonts.exo2(
                              color: Colors.white,
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.buffer,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                final _state =
                                    widget.endSideMenuState.currentState;
                                if (_state.isOpened) {
                                  _state.closeSideMenu();
                                } else {
                                  _state.openSideMenu();
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                LineIcons.gear,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SlimyCard(
                    topCardHeight: MediaQuery.of(context).size.height * 0.45,
                    bottomCardHeight: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.9,
                    color: Colors.cyan.withOpacity(0.9),
                    topCardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: WidgetCircularAnimator(
                              size: 150,
                              innerIconsSize: 5,
                              outerIconsSize: 5,
                              innerColor: Colors.white,
                              outerColor: Colors.amberAccent,
                              reverse: true,
                              innerAnimation: Curves.bounceInOut,
                              outerAnimation: Curves.easeInOutQuart,
                              child: Center(
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('images/swastik.jpg'),
                                  radius: 100,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Swastik Nath",
                          style: GoogleFonts.exo2(
                              letterSpacing: 2.0, fontWeight: FontWeight.bold),
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Apparent Saints of the Era rises like the holiest waves of the sea.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.exo2(
                              fontStyle: FontStyle.italic, letterSpacing: 1.5),
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: OutlineButton(
                                onPressed: () {},
                                // color: Colors.yellow,
                                borderSide: BorderSide(color: Colors.yellow),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "Editorial Board Member",
                                  style: GoogleFonts.montserrat(
                                      letterSpacing: 1.0,
                                      fontSize: 9.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    bottomCardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Joined: June, 2020",
                          style: GoogleFonts.exo2(letterSpacing: 1.5),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(LineIcons.linkedin),
                              onPressed: () {
                                print("Pressed Linkedin");
                              },
                            ),
                            IconButton(
                              icon: Icon(LineIcons.github),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(LineIcons.instagram),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(LineIcons.facebook),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(LineIcons.medium),
                              onPressed: () {},
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
