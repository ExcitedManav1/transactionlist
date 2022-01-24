import 'package:flutter/material.dart';

class NewTransaciton extends StatelessWidget {
  final inputTitle = TextEditingController();
  final inputAmount = TextEditingController();
  final Function addTx;

  void submitData() {
    final title = inputTitle.text;
    final amount = double.parse(inputAmount.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    addTx(inputTitle.text, double.parse(inputAmount.text));
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: inputAmount,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
                onPressed: submitData, child: Text('Add Transaction')),
          ],
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
