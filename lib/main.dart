import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:transactionlist/widgets/chart.dart';
import 'package:transactionlist/widgets/new_transaction.dart';
import 'package:transactionlist/widgets/transaction_list.dart';

import './models/transaction.dart';

void main() {
  runApp(MyHonePage());
}

class MyHonePage extends StatefulWidget {
  @override
  State<MyHonePage> createState() => _MyHonePageState();
}

class _MyHonePageState extends State<MyHonePage> {
  final List<Transaction> _usertransactions = [];

  List<Transaction> get _recentTransaction {
    return _usertransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String txTitle, double txAmount) {
    final newtx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());
    setState(() {
      _usertransactions.add(newtx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showSlidingBottomSheet(ctx, builder: (_) {
      return SlidingSheetDialog(
        cornerRadius: 10,
        builder: (_, state) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: NewTransaciton(_addTransaction));
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          accentColor: Colors.red,
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: GoogleFonts.dongle(
                  fontSize: 40, fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: GoogleFonts.dongle(
                        fontSize: 40, fontWeight: FontWeight.normal),
                  ))),
      home: Builder(builder: (context) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => startAddNewTransaction(context),
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => startAddNewTransaction(context),
                icon: Icon(Icons.add_circle),
              ),
            ],
            title: Text(
              'Your Transactions',
              style: Theme.of(context).appBarTheme.textTheme!.headline6,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Chart(_recentTransaction),
                TransactionList(_usertransactions),
              ],
            ),
          ),
        );
      }),
    );
  }
}
