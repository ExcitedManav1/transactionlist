import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (int i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekday.day &&
            recentTransaction[i].date.month == weekday.month &&
            recentTransaction[i].date.year == weekday.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      print(DateFormat.E().format(weekday));
      print(totalSum);
      return {'day': DateFormat.E().format(weekday), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransaction);
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 6,
      child: Row(),
    );
  }
}
