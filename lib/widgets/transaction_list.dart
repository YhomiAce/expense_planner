import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    final themeStyle = Theme.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  "No Transactions Added Yet",
                  style: themeStyle.textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
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
                    style: themeStyle.textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          textColor: themeStyle.errorColor,
                          icon: Icon(Icons.delete),
                          label: Text("Delete"),
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: themeStyle.errorColor,
                          onPressed: () {
                            deleteTx(transactions[index].id);
                          },
                        ),
                ),
              );
            },
            itemCount: transactions.length,
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
//                               color: themeStyle.primaryColor,
//                             ),
//                           ),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: themeStyle.primaryColor,
//                               width: 2,
//                             ),
//                           ),
//                           padding: EdgeInsets.all(10)),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             transactions[index].title,
//                             style: themeStyle.textTheme.title,
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
