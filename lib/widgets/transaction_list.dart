import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
final List<Transaction> transaction;

TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transaction.map((tx) {
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
                  style: const TextStyle(fontSize: 20, color: Colors.purple),
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
    );
  }
}
