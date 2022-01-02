import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions Added Yet",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text("\$${transactions[index].amount}")),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () {
                        deleteTx(transactions[index].id);
                      },
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

// return Card(
//                   child: Row(
//                     children: [
//                       Container(
//                           margin: EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 20),
//                           child: Text(
//                             '\$${transactions[index].amount.toStringAsFixed(2)}',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Theme.of(context).primaryColor,
//                             ),
//                           ),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: Theme.of(context).primaryColor,
//                               width: 2,
//                             ),
//                           ),
//                           padding: EdgeInsets.all(10)),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             transactions[index].title,
//                             style: Theme.of(context).textTheme.title,
//                           ),
//                           Text(
//                             DateFormat.yMMMd().format(transactions[index].date),
//                             // DateFormat('yyyy-MM-dd').format(tx.date),
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
