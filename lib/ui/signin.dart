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

import 'dart:math';

import 'package:anuranan_sahitya_app/utils/PageNav.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hb_check_code/hb_check_code.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

String buildCaptcha() {
  String code = "";
  for (var i = 0; i < 8; i++) {
    code = code + Random().nextInt(9).toString();
  }
  return code;
}

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  String code = buildCaptcha();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/signin.jpg'),
                            fit: BoxFit.cover)),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Image.asset(
                        'images/signin.jpg',
                        fit: BoxFit.cover,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(top: 30, left: 20),
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 8.0, left: 20, right: 20, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Enter Your Registered Email ID: ",
                            labelStyle:
                                GoogleFonts.montserrat(letterSpacing: 2.0),
                            focusColor: Colors.green,
                            helperText: "you@email.com",
                            prefixIcon: Icon(Icons.alternate_email),
                            helperStyle:
                                GoogleFonts.montserrat(letterSpacing: 2.0),
                            // errorText: "Whoa! That might not be a valid Email.",
                            // errorStyle: GoogleFonts.montserrat(
                            //     letterSpacing: 2.0, color: Colors.red),
                            contentPadding: EdgeInsets.all(8.0),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Enter Your Password ",
                            labelStyle:
                                GoogleFonts.montserrat(letterSpacing: 2.0),
                            focusColor: Colors.green,
                            helperText: "Password Must be 8 chars long.",
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            helperStyle:
                                GoogleFonts.montserrat(letterSpacing: 2.0),
                            // errorText: "Whoa! That might not be a valid Email.",
                            // errorStyle: GoogleFonts.montserrat(
                            //     letterSpacing: 2.0, color: Colors.red),
                            contentPadding: EdgeInsets.all(8.0),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            HBCheckCode(
                              code: code,
                              width: 200,
                              backgroundColor: Colors.white,
                            ),
                            IconButton(
                                icon: Icon(LineIcons.refresh),
                                onPressed: () {
                                  setState(() {
                                    code = buildCaptcha();
                                  });
                                })
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Complete the Captcha ",
                            labelStyle:
                                GoogleFonts.montserrat(letterSpacing: 2.0),
                            focusColor: Colors.green,
                            helperText:
                                "Find out the digits written in the image",
                            prefixIcon: Icon(Icons.security_rounded),
                            helperStyle:
                                GoogleFonts.montserrat(letterSpacing: 2.0),
                            // errorText: "Whoa! That might not be a valid Email.",
                            // errorStyle: GoogleFonts.montserrat(
                            //     letterSpacing: 2.0, color: Colors.red),
                            contentPadding: EdgeInsets.all(8.0),
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                        child: OutlineButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          splashColor: Colors.lightBlueAccent,
                          padding: EdgeInsets.all(8.0),
                          onPressed: () {
                            PageNav.sentToHome(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.vpn_key_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Proceed With Sign In',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 16.0, bottom: 8.0, left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                height: 1,
                                thickness: 1,
                                indent: 20,
                                endIndent: 20,
                                color: Colors.grey[500],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "OR LOGIN WITH",
                                style: GoogleFonts.montserrat(
                                    letterSpacing: 2.0, fontSize: 10.0),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                height: 1,
                                thickness: 1,
                                indent: 20,
                                endIndent: 20,
                                color: Colors.grey[500],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 16.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: SignInButton.mini(
                                buttonType: ButtonType.google,
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              child: SignInButton.mini(
                                buttonType: ButtonType.microsoft,
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              child: SignInButton.mini(
                                buttonType: ButtonType.facebook,
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              child: SignInButton.mini(
                                buttonType: ButtonType.linkedin,
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              child: SignInButton.mini(
                                buttonType: ButtonType.github,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height / 4,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      aspectRatio: 2.0,
                      autoPlayCurve: Curves.easeInCubic,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ],
                            gradient: RadialGradient(
                                center: Alignment.centerRight,
                                radius: 2,
                                colors: [
                                  Colors.blueAccent.withOpacity(0.9),
                                  Colors.black.withOpacity(0.3)
                                ])),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Icon(
                                LineIcons.umbrella,
                                size: 70,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Access Your Content \nFrom Anywhere.",
                                      maxLines: 2,
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 8.0, right: 16.0),
                                    child: Text(
                                      "Your Anuranan Account syncs all your saved drafts, published contents across "
                                      "different devices. Start editing your article on your iPad, end up publishing from your Anroid Device",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white),
                                      textAlign: TextAlign.justify,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: RadialGradient(
                                center: Alignment.centerRight,
                                radius: 2,
                                colors: [
                                  Colors.pinkAccent.withOpacity(0.9),
                                  Colors.black.withOpacity(0.3)
                                ])),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Icon(
                                LineIcons.lock,
                                size: 70,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      "Your Data, Your Rights.\nPrivacy at the peak.",
                                      maxLines: 2,
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 8.0, right: 16.0),
                                    child: Text(
                                      "The Anuranan App provides you with the option to retain your drafts, profile, preferences "
                                      "on device or you can sync them up with your Anuranan Account for a seamless exprerience "
                                      "across all your devices.",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white),
                                      textAlign: TextAlign.justify,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
