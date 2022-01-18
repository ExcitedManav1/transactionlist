import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(MyHonePage());
}

class MyHonePage extends StatelessWidget {
  const MyHonePage({Key? key}) : super(key: key);

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
        body: Column(
          children: <Widget>[
            Card(
              child: Container(
                child: Text('Chart'),
                width: double.infinity,
              ),
              color: Color(0xFFF2F2F2),
            ),
            Card(
              child: Text('List of TX')
            ),
          ],
        ),
      ),
    );
  }
}
