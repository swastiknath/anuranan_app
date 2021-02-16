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
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
  GlobalKey<SideMenuState> endSideMenuState;
  Key key;

  UserDetailsPage({this.key, @required this.endSideMenuState});
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  List<WritingStatsData> data = [
    WritingStatsData(
      month: 'JAN',
      number: 480,
      type: 'POEM',
      color: Colors.yellow.withOpacity(0.7),
    ),
    WritingStatsData(
      month: 'FEB',
      number: 204,
      type: 'PROSE',
      color: Colors.lightBlueAccent.withOpacity(0.7),
    ),
    WritingStatsData(
      month: 'MAR',
      number: 100,
      type: 'NOVEL',
      color: Colors.pink.withOpacity(0.7),
    ),
    WritingStatsData(
      month: 'APR',
      number: 350,
      type: 'SPORTS',
      color: Colors.green.withOpacity(0.7),
    ),
    WritingStatsData(
      month: 'MAY',
      number: 30,
      type: 'MISC',
      color: Colors.deepOrangeAccent.withOpacity(0.7),
    ),
    WritingStatsData(
      month: 'JUN',
      number: 60,
      type: 'MISC',
      color: Colors.indigo.withOpacity(0.7),
    ),
    WritingStatsData(
      month: 'JUL',
      number: 300,
      type: 'MISC',
      color: Colors.purpleAccent.withOpacity(0.7),
    ),
    WritingStatsData(
      month: 'AUG',
      number: 489,
      type: 'MISC',
      color: Colors.brown.withOpacity(0.7),
    ),
    WritingStatsData(
      month: 'SEP',
      number: 85,
      type: 'MISC',
      color: Colors.blueGrey.withOpacity(0.7),
    ),
    WritingStatsData(
      month: 'OCT',
      number: 45,
      type: 'MISC',
      color: Colors.cyan.withOpacity(0.7),
    ),
    WritingStatsData(
      month: 'NOV',
      number: 405,
      type: 'MISC',
      color: Colors.greenAccent.withOpacity(0.7),
    ),
    WritingStatsData(
      month: 'DEC',
      number: 256,
      type: 'MISC',
      color: Colors.red.withOpacity(0.7),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

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
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            blurRadius: 20.0,
                            spreadRadius: 20.0)
                      ],
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
                    color: Colors.black12,
                    topCardWidget: ClipRect(
                      clipBehavior: Clip.antiAlias,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(20.0),
                            // boxShadow: <BoxShadow>[
                            //   new BoxShadow(
                            //     color: Colors.black26,
                            //     blurRadius: 5.0,
                            //     offset: new Offset(5.0, 5.0),
                            //   ),
                            // ],
                          ),
                          child: Column(
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
                                    color: Colors.yellow,
                                    letterSpacing: 2.0,
                                    fontWeight: FontWeight.bold),
                                maxLines: 3,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Apparent Saints of the Era rises like the holiest waves of the sea.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.exo2(
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    letterSpacing: 1.5),
                                maxLines: 3,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: OutlineButton(
                                      onPressed: () {},
                                      // color: Colors.yellow,
                                      borderSide:
                                          BorderSide(color: Colors.yellow),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Editorial Board Member",
                                        style: GoogleFonts.montserrat(
                                            letterSpacing: 1.0,
                                            fontSize: 9.0,
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Activity Summary",
                  style: GoogleFonts.titilliumWeb(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(
                    LineIcons.question_circle,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    Widget snack = SnackBar(
                        elevation: 15.0,
                        backgroundColor: Colors.yellow,
                        content: Text(
                          'Activity Summary is an useful measure to gauge your Anuranan Privilege Tier(TM) Status. Statistics are updated in Real Time.',
                          style: GoogleFonts.titilliumWeb(
                            color: Colors.black,
                            letterSpacing: 1.5,
                          ),
                        ),
                        action: SnackBarAction(
                            label: 'Done',
                            onPressed: () {
                              Scaffold.of(context).hideCurrentSnackBar();
                            }));

                    Scaffold.of(context).showSnackBar(snack);
                  })
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SfCartesianChart(
                    title: ChartTitle(
                        text: 'Monthly Engagement',
                        textStyle: GoogleFonts.josefinSans(
                          letterSpacing: 1.5,
                          fontSize: 11,
                        ),
                        alignment: ChartAlignment.far),
                    crosshairBehavior: CrosshairBehavior(
                        activationMode: ActivationMode.singleTap,
                        lineType: CrosshairLineType.both),
                    trackballBehavior: TrackballBehavior(
                        activationMode: ActivationMode.singleTap,
                        tooltipDisplayMode: TrackballDisplayMode.nearestPoint),
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries<WritingStatsData, String>>[
                      BubbleSeries(
                        dataSource: data,
                        sizeValueMapper: (WritingStatsData wd, _) => wd.number,
                        pointColorMapper: (WritingStatsData wd, _) => wd.color,
                        yValueMapper: (WritingStatsData wd, _) => wd.number,
                        xValueMapper: (WritingStatsData wd, _) => wd.month,
                        // gradient:
                        //     LinearGradient(colors: [Colors.red, Colors.blue]),
                        xAxisName: 'Months',
                        yAxisName: 'Engagement Point',
                        animationDuration: 2.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SfCircularChart(
                    title: ChartTitle(
                        text: 'Content-Wise Engagement Distribution',
                        textStyle: GoogleFonts.josefinSans(
                          letterSpacing: 1.5,
                          fontSize: 11,
                        ),
                        alignment: ChartAlignment.far),
                    series: <CircularSeries<WritingStatsData, String>>[
                      DoughnutSeries(
                        dataSource: data,
                        xValueMapper: (WritingStatsData wd, _) => wd.type,
                        yValueMapper: (WritingStatsData wd, _) => wd.number,
                        // pointColorMapper: (WritingStatsData wd, _) => wd.color,
                        dataLabelMapper: (WritingStatsData wd, _) => wd.type,
                        explode: true,
                        explodeIndex: 0,
                        groupMode: CircularChartGroupMode.value,
                        groupTo: 4,
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WritingStatsData {
  String month;
  int number;
  String type;
  Color color;

  WritingStatsData({this.month, this.number, this.type, this.color});
}
