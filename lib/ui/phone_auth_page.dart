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
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hb_check_code/hb_check_code.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

String buildCaptcha() {
  String code = "";
  for (var i = 0; i < 5; i++) {
    code = code + Random().nextInt(9).toString();
  }
  return code;
}

class PhoneAuthPage extends StatefulWidget {
  @override
  _PhoneAuthPageState createState() => _PhoneAuthPageState();
  FirebaseAuth auth;

  PhoneAuthPage({@required this.auth});
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  String code = buildCaptcha();

  TextEditingController editingController = TextEditingController();

  void phoneSignIn(BuildContext context, FirebaseAuth auth, String phoneNum,
      TextEditingController smsCodeController) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNum,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await widget.auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Widget snack = SnackBar(
            elevation: 15.0,
            backgroundColor: Colors.yellow,
            content: Text(
              "We are sorry, but we are having trouble processing your request right now, please use"
              " another Sign-In options, as of now. Error Code 0X145.",
              style: GoogleFonts.titilliumWeb(
                color: Colors.black,
                letterSpacing: 1.5,
              ),
            ),
            action: SnackBarAction(
                label: 'Send Report.',
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                }),
          );

          Scaffold.of(context).showSnackBar(snack);
        }
      },
      codeSent: (String verificationId, int resendToken) async {
        String smsCode = returnSMSCode(smsCodeController);
        PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        await auth.signInWithCredential(phoneAuthCredential);
      },
      codeAutoRetrievalTimeout: (String verificationId) async {},
      timeout: Duration(seconds: 60),
    );
  }

  String returnSMSCode(TextEditingController editingController) {
    return editingController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Lottie.asset(
                      'assets/phone_comm.json',
                      height: MediaQuery.of(context).size.height / 3.5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'images/main_logo.png',
                          height: 80,
                          width: 80,
                          fit: BoxFit.contain,
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  "Sign in With your Phone Number",
                  style: GoogleFonts.exo2(
                    fontSize: 30,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Enter Your Phone Number: ",
                      labelStyle: GoogleFonts.montserrat(letterSpacing: 2.0),
                      focusColor: Colors.green,
                      helperText: "+91 1234567890",
                      prefixIcon: Icon(
                        Icons.phone,
                      ),
                      helperStyle: GoogleFonts.montserrat(letterSpacing: 2.0),
                      // errorText: "Whoa! That might not be a valid Email.",
                      // errorStyle: GoogleFonts.montserrat(
                      //     letterSpacing: 2.0, color: Colors.red),
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    controller: editingController,
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
                      labelStyle: GoogleFonts.montserrat(letterSpacing: 2.0),
                      focusColor: Colors.green,
                      helperText: "Find out the digits written in the image",
                      prefixIcon: Icon(Icons.security_rounded),
                      helperStyle: GoogleFonts.montserrat(letterSpacing: 2.0),
                      // errorText: "Whoa! That might not be a valid Email.",
                      // errorStyle: GoogleFonts.montserrat(
                      //     letterSpacing: 2.0, color: Colors.red),
                      contentPadding: EdgeInsets.all(8.0),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      color: Colors.red,
                      splashColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      onPressed: () {
                        showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) => ClipRRect(
                              child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaY: 20,
                              sigmaX: 20,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                Color(0xff1a2a6c),
                                Color(0xffb21f1f),
                                Color(0xfffdbb2d)
                              ])),
                              height: MediaQuery.of(context).size.height / 2.0,
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: "Enter the Security Code",
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        labelStyle: GoogleFonts.montserrat(
                                            letterSpacing: 2.0,
                                            color: Colors.white),
                                        focusColor: Colors.green,
                                        helperText: "Check Your Messages.",
                                        prefixIcon: Icon(
                                          FontAwesomeIcons.sms,
                                          color: Colors.white,
                                        ),
                                        helperStyle: GoogleFonts.montserrat(
                                            letterSpacing: 2.0,
                                            color: Colors.white),
                                        // errorText: "Whoa! That might not be a valid Email.",
                                        // errorStyle: GoogleFonts.montserrat(
                                        //     letterSpacing: 2.0, color: Colors.red),
                                        contentPadding: EdgeInsets.all(8.0),
                                        border: OutlineInputBorder(),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Waiting for the Message...",
                                          style: GoogleFonts.josefinSans(
                                              letterSpacing: 2.0,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          "Anuranan Account v1.0",
                                          style: GoogleFonts.josefinSans(
                                              letterSpacing: 2.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SpinKitPulse(
                                          color: Colors.white,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                        );
                      },
                      elevation: 15.0,
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(
                            LineIcons.phone,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            "Sign In With Phone",
                            style: GoogleFonts.josefinSans(
                                letterSpacing: 2.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Anuranan App collects and store your phone number as a measure "
                    "of login method for your Anuranan Account, but cannot access any "
                    "data associated with it. ",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.josefinSans(
                      letterSpacing: 1.5,
                    ),
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
