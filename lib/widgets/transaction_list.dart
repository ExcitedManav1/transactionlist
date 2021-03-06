import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  TransactionList(this.transactionList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactionList.isEmpty
          ? Column(
              children: <Widget>[
                Text('No Transaction Here',style: Theme.of(context).textTheme.headline6,),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/noTransaction.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactionList.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          '\$${transactionList[index].amount.toStringAsFixed(2)}',
                          style: GoogleFonts.dongle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            transactionList[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(DateFormat.yMMMd()
                              .format(transactionList[index].date)),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
