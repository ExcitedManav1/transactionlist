import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  final List<Transaction> _usertransactions = [];

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaciton(_addTransaction),
        TransactionList(_usertransactions)
      ],
    );
  }
}
