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

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
    });
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
                  InputDecoration(icon: Icon(Icons.star), labelText: 'Title'),
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.number,
              onChanged: (val) {
                //titleInput = val;
              },
              controller: amountController,
              decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on_outlined),
                  labelText: 'Amount'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: 70,
              child: Row(
                children: [
                  Text('No Date Chosen'),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              child: Text("Add Transaction"),
              style: ElevatedButton.styleFrom(onPrimary: Colors.white),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
