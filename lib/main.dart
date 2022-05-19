import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';

import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //User input properties
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  final List<Transaction> _userTransaction = [
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

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
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
              TransactionList(_userTransaction)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            startAddNewTransaction(context);
          },
        ),
      ),
    );
  }
}
