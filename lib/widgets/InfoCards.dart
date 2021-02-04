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

class InfoCards extends StatefulWidget {
  @override
  _InfoCardsState createState() => _InfoCardsState();
  final String description;
  final String iconName;
  final String header;
  Function onTapped;

  InfoCards(
      {@required this.header,
      @required this.iconName,
      @required this.description,
      this.onTapped});
}

class _InfoCardsState extends State<InfoCards> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.9,
        child: Container(
          margin:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.iconName), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10.0),
            // border: Border(
            //     top: BorderSide(color: Colors.white),
            //     bottom: BorderSide(color: Colors.white),
            //     left: BorderSide(color: Colors.white),
            //     right: BorderSide(color: Colors.white)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(16.0),
                child: Text(
                  widget.description,
                  style: GoogleFonts.comfortaa(
                      color: Colors.white, letterSpacing: 1.5),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(widget.header,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        fontSize: 65,
                        color: Colors.white),
                    strutStyle: StrutStyle()),
              ),
              // Expanded(
              //   flex: 2,
              //   child: Center(
              //     child: Padding(
              //       padding: EdgeInsets.all(20.0),
              //       child: Text(
              //         widget.description,
              //         textAlign: TextAlign.justify,
              //         style: GoogleFonts.josefinSans(
              //             fontSize: 20.0, color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
              // Expanded(
              //   flex: 0,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       IconButton(
              //           icon: Icon(
              //             Icons.arrow_right_alt_outlined,
              //             color: Colors.white,
              //           ),
              //           onPressed: () {}),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
