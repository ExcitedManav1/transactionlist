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
      child: ListView.builder(
        itemCount: transactionList.length,
        itemBuilder: (ctx, index){
          return Card(
            child: Row(
              children: [
                Container(
                  child: Text(
                    '\$${transactionList[index].amount}',
                    style: GoogleFonts.dongle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color(0xFFD22E10),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFD22E10),
                        width: 2,
                      )),
                  margin: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      transactionList[index].title,
                      style: GoogleFonts.dongle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(DateFormat.yMMMd().format(transactionList[index].date)),
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
