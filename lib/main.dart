import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "t1",
      title: "New shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t1",
      title: "Weekly groceries",
      amount: 16.53,
      date: DateTime.now(),
    )
  ];

  //User input properties
  // String titleInput;
  // String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: const BoxDecoration(),
                  width: double.infinity,
                  child: const Text(
                    'CHART',
                  )),
              elevation: 5,
            ),
            Card(
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
                        // print(titleInput);
                        //print(amountInput);
                      },
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text(
                          "\$ ${tx.amount}",
                          style: const TextStyle(
                              fontSize: 20, color: Colors.purple),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tx.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        Text(
                          DateFormat.yMMMd().format(tx.date),
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ));
              }).toList(),
            )
          ],
        ));
  }
}
