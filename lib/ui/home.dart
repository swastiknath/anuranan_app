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

import 'package:anuranan_sahitya_app/ui/saved_liked.dart';
import 'package:anuranan_sahitya_app/ui/search.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

import 'explorePage.dart';
import 'userinfo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  FirebaseAuth fAuth;

  HomePage({@required this.fAuth});
}

class _HomePageState extends State<HomePage> {
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

  static final GlobalKey<SideMenuState> sideMenuKey =
      GlobalKey<SideMenuState>();
  int _selectedIndex = 0;
  final List<Widget> tabs = [
    ExplorePage(
      endSideMenuKey: sideMenuKey,
    ),
    SavedLikedPage(
      endSideMenuState: sideMenuKey,
    ),
    SearchPage(
      endSideMenuState: sideMenuKey,
    ),
    UserDetailsPage(
      endSideMenuState: sideMenuKey,
    )
  ];
  TextStyle optionStyle = GoogleFonts.comfortaa(
      color: Colors.white,
      fontSize: 10,
      fontWeight: FontWeight.bold,
      letterSpacing: 3.0);
  AnimationController fabMenuAnimationController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SideMenu(
        key: sideMenuKey,
        inverse: true,
        background: Colors.lightBlue[200],
        menu: spawnMenu(),
        type: SideMenuType.shrikNRotate,
        child: Scaffold(
          extendBody: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FabCircularMenu(
            fabOpenIcon: Icon(
              LineIcons.pencil,
              size: 25,
              semanticLabel: 'Compose',
              color: Colors.white,
            ),
            fabIconBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ringColor: Colors.lightBlue.withOpacity(0.6),
            fabColor: Colors.lightBlueAccent,
            children: [
              IconButton(
                icon: Icon(
                  LineIcons.video_camera,
                  size: 30,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  LineIcons.image,
                  size: 30,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  LineIcons.pencil_square_o,
                  size: 30,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  LineIcons.newspaper_o,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          bottomNavigationBar: Container(
            margin: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: ClipRect(
                  clipBehavior: Clip.antiAlias,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(50.0),
                          shape: BoxShape.rectangle),
                      child: GNav(
                          gap: 6,
                          curve: Curves.ease,
                          activeColor: Colors.white,
                          iconSize: 25,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          duration: Duration(milliseconds: 800),
                          // tabBackgroundColor: Colors.grey[800].withOpacity(0.3),
                          tabs: [
                            GButton(
                              icon: LineIcons.home,
                              text: 'EXPLORE',
                              iconColor: Colors.white,
                              backgroundGradient: RadialGradient(colors: [
                                Colors.black,
                                Colors.lightBlueAccent
                              ], center: Alignment.centerRight, radius: 5),
                              textStyle: optionStyle,
                            ),
                            GButton(
                              icon: LineIcons.bookmark_o,
                              text: 'SAVED',
                              iconColor: Colors.white,
                              backgroundGradient: RadialGradient(
                                  colors: [Colors.black, Colors.redAccent],
                                  center: Alignment.centerRight,
                                  radius: 5),
                              textStyle: optionStyle,
                            ),
                            GButton(
                              icon: LineIcons.search,
                              iconColor: Colors.white,
                              backgroundGradient: RadialGradient(
                                  colors: [Colors.black, Colors.greenAccent],
                                  center: Alignment.centerRight,
                                  radius: 5),
                              text: 'SEARCH',
                              textStyle: optionStyle,
                            ),
                            GButton(
                              leading: CircleAvatar(
                                radius: 11,
                                backgroundImage:
                                    AssetImage('images/swastik.jpg'),
                              ),
                              backgroundGradient: RadialGradient(colors: [
                                Colors.black,
                                Colors.deepPurpleAccent
                              ], center: Alignment.centerRight, radius: 5),
                              text: 'SWASTIK',
                              textStyle: optionStyle,
                            ),
                          ],
                          selectedIndex: _selectedIndex,
                          onTabChange: (index) {
                            setState(() {
                              _selectedIndex = index;
                            });
                          }),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: tabs[_selectedIndex],
        ),
      ),
    );
  }
}

class ArticleCards extends StatelessWidget {
  const ArticleCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Container(
        height: 250,
        margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0, top: 6.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/intro_landing1.jpg'),
              fit: BoxFit.cover),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Semantics Redefined",
              maxLines: 3,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  letterSpacing: 1.5,
                  color: Colors.white),
            ),
            Text(
              "Swastik Nath",
              style: GoogleFonts.comfortaa(
                  letterSpacing: 2.0, color: Colors.white),
            )
          ],
        ),
      )
    ]);
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
                backgroundImage: AssetImage('images/swastik.jpg'),
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
            "Anuranan Official App  \nVersion 0.0.8+184-alpha1",
            style: TextStyle(
                fontFamily: "Jetbrains Mono", fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Made with ❤ \nBy Swastik Nath at Navi Mumbai, India. \n\nLast Updated on 12.02.2021",
            style: TextStyle(fontFamily: "Jetbrains Mono"),
          ),
        ),
        ListTile(
          subtitle: Text(
            "This application is an intellectual property of SwastikNath Group Holdings LLC. Opinions expressed, Contents published"
            " within the app by the users are their own and are neither by any means endorsed nor by any way verified by SwastikNath Group Holdings LLC."
            "\nCopyright © 2021 Swastik Nath. All Rights Reserved.",
            style: GoogleFonts.titilliumWeb(fontSize: 9),
          ),
        )
      ],
    ),
  );
}
