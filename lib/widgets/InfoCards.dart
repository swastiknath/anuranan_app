import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCards extends StatelessWidget {
  const InfoCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: 0.6,
        child: Container(
          margin:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 0.0, bottom: 10.0),
          decoration: BoxDecoration(
              color: const Color(0xFF0E3311).withOpacity(0.5),
              borderRadius: BorderRadius.circular(5.0),
              border: Border(
                  top: BorderSide(color: Colors.white),
                  bottom: BorderSide(color: Colors.white),
                  left: BorderSide(color: Colors.white),
                  right: BorderSide(color: Colors.white)),
              boxShadow: [BoxShadow(spreadRadius: 5.0, blurRadius: 2.0)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: Image.asset('images/main_logo.png'),
              ),
              Center(
                child: Text(
                  "Hello There",
                  style:
                      GoogleFonts.montserrat(fontSize: 50, color: Colors.white),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and "
                    "typesetting industry. Lorem Ipsum has been the industry's standard "
                    "dummy text ever since the 1500s, when an unknown printer took a "
                    "galley of type and scrambled it to make a type specimen book. "
                    "It has survived not only five centuries, but also the leap int"
                    "o electronic typesetting, remaining essentially unchanged. "
                    "It was popularised in the 1960s with the release of Letraset"
                    " sheets containing Lorem Ipsum passages, and more recently w"
                    "ith desktop publishing software like Aldus PageMaker including v"
                    "ersions of Lorem Ipsum.",
                    style: GoogleFonts.josefinSans(
                        fontSize: 15.0, color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
