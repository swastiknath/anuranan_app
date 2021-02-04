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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hb_check_code/hb_check_code.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    String code = "";
    for (var i = 0; i < 8; i++) {
      code = code + Random().nextInt(9).toString();
    }
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
                        child: HBCheckCode(
                          code: code,
                          width: 200,
                          backgroundColor: Colors.white,
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
                            children: [
                              Icon(Icons.vpn_key_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Proceed With Sign In',
                                style:
                                    GoogleFonts.montserrat(letterSpacing: 2.0),
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
              ],
            ),
          ),
        )),
      ),
    );
  }
}
