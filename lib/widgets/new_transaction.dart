import 'package:flutter/material.dart';

class NewTransaciton extends StatefulWidget {
  final Function addTx;

  NewTransaciton(this.addTx);

  @override
  State<NewTransaciton> createState() => _NewTransacitonState();
}

class _NewTransacitonState extends State<NewTransaciton> {
  final inputTitle = TextEditingController();

  final inputAmount = TextEditingController();

  void submitData() {
    final title = inputTitle.text;
    final amount = double.parse(inputAmount.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.addTx(title, amount);
    Navigator.of(context).pop();
  }

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
            ElevatedButton(
                onPressed: submitData, child: Text('Add Transaction')),
          ],
          crossAxisAlignment: CrossAxisAlignment.end,
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }
}