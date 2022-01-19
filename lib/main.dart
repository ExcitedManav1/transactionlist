import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transactionlist/transaction.dart';

void main() {
  runApp(MyHonePage());
}

class MyHonePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
        id: 'T1', title: 'IceCream', amount: 30.00, date: DateTime.now()),
    Transaction(id: 'T1', title: 'Pizza', amount: 250.00, date: DateTime.now()),
  ];

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
            Card(
              child: Column(
                children: transaction.map((tx) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          child: Text(tx.amount.toString()),
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Color(0xFF000000),
                            width: 2,
                          )),
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          padding: EdgeInsets.all(10),
                        ),
                        Column(
                          children: <Widget>[
                            Text(tx.title,style: GoogleFonts.dongle(),),
                            Text(tx.date.toString())
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
