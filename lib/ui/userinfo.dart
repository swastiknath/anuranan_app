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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:slimy_card/slimy_card.dart';

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
          SlimyCard(
            color: Colors.cyan,
            topCardWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage('images/swastik.jpg'),
                        fit: BoxFit.cover),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 20),
                    ],
                  ),
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
                      onPressed: () {},
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
    );
  }
}
