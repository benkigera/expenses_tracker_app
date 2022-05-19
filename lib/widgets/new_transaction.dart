import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      titleController.text,
      double.parse(amountController.text),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              onChanged: (val) {
                //  amountInput = val;
              },
              controller: titleController,
              decoration:
                  InputDecoration(icon: Icon(Icons.start), labelText: 'Title'),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.number,
              onChanged: (val) {
                //titleInput = val;
              },
              controller: amountController,
              decoration:
                  InputDecoration(icon: Icon(Icons.start), labelText: 'Amount'),
            ),
            TextButton(
              child: Text("Add Transaction"),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.purple)),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
