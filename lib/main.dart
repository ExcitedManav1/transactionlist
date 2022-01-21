import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets/user_transaction.dart';

void main() {
  runApp(MyHonePage());
}

class MyHonePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Transactions',
            style: GoogleFonts.dongle(fontSize: 40),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Container(
                  child: Text('Chart'),
                  width: double.infinity,
                ),
                color: Color(0xFFEF2B2B),
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
