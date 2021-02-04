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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _endSideMenuKey,
      inverse: true,
      background: Colors.lightBlue[200],
      menu: spawnMenu(),
      type: SideMenuType.shrikNRotate,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(
              16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      alignment: Alignment.topRight,
                      icon: Icon(FontAwesomeIcons.buffer),
                      onPressed: () {
                        final _state = _endSideMenuKey.currentState;
                        if (_state.isOpened) {
                          _state.closeSideMenu();
                        } else {
                          _state.openSideMenu();
                        }
                      },
                      iconSize: 30,
                    ),
                  ],
                ),
                Text(
                  "Greetings, Swastik",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget spawnMenu() {
  return SingleChildScrollView(
    padding: EdgeInsets.symmetric(vertical: 50.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/main_logo.png'),
                radius: 22.0,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Howdy Swastik?",
                style: GoogleFonts.josefinSans(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
        ListTile(
          onTap: () {
            print("Tapped");
          },
          leading: Icon(
            Icons.home,
            size: 30.0,
          ),
          title: Text(
            "Welcome Home",
            style: GoogleFonts.montserrat(letterSpacing: 2.0),
          ),
        ),
        ListTile(
          onTap: () {
            print("Tapped");
          },
          leading: Icon(Icons.storage, size: 30.0, color: Colors.blueGrey[800]),
          title: Text(
            "Magazines Archive",
            style: GoogleFonts.montserrat(letterSpacing: 2.0),
          ),
        ),
        ListTile(
          onTap: () {
            print("Tapped");
          },
          leading: Icon(Icons.mic, size: 30.0, color: Colors.blueGrey[800]),
          title: Text(
            "Adda Te Atkhana",
            style: GoogleFonts.montserrat(letterSpacing: 2.0),
          ),
        ),
        ListTile(
          onTap: () {
            print("Tapped");
          },
          leading: Icon(
            Icons.bookmark_border,
            size: 30.0,
            color: Colors.blueGrey[800],
          ),
          title: Text(
            "Liked by You",
            style: GoogleFonts.montserrat(letterSpacing: 2.0),
          ),
        ),
        ListTile(
          onTap: () {
            print("Tapped");
          },
          leading: Icon(
            Icons.settings,
            size: 30.0,
          ),
          title: Text(
            "Preferences",
            style: GoogleFonts.montserrat(letterSpacing: 2.0),
          ),
        ),
        Divider(
          thickness: 1,
          // indent: 20,
          endIndent: 20,
          color: Colors.blue[800],
        ),
        SizedBox(
          height: 40,
        ),
        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.blue[800], width: 3.0),
          ),
          title: Text(
            "Anuranan Official App  \nVersion 0.0.2-alpha1",
            style: TextStyle(
                fontFamily: "Jetbrains Mono", fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Built with ❤ \nBy Swastik Nath at Navi Mumbai, India. \n\nLast Updated on 04.02.2021",
            style: TextStyle(fontFamily: "Jetbrains Mono"),
          ),
        )
      ],
    ),
  );
}
