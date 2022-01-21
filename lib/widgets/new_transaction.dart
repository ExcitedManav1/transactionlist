import 'package:flutter/material.dart';
import './user_transaction.dart';

class NewTransaciton extends StatelessWidget {
  final inputTitle = TextEditingController();
  final inputAmount = TextEditingController();
  final Function addTx;


  NewTransaciton(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: inputTitle,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: inputAmount,
            ),
            FlatButton(
                onPressed:(){
                  addTx(inputTitle.text,double.parse(inputAmount.text));
                } ,
                child: Text('Add Transaction')),
          ],
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
