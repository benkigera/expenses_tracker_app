import 'package:flutter/material.dart';
class NewTransaction extends StatelessWidget {
  final titleController =TextEditingController();
  final amountController =TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

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
              decoration: InputDecoration(
                  icon: Icon(Icons.start), labelText: 'Title'),
            ),
            TextField(
              onChanged: (val) {
                //titleInput = val;
              },
              controller: amountController,
              decoration: InputDecoration(
                  icon: Icon(Icons.start), labelText: 'Amount'),
            ),
            TextButton(
              child: Text("Add Transaction"),
              style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all(Colors.purple)),
              onPressed: () {
               addTx(titleController.text,double.parse(amountController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}

