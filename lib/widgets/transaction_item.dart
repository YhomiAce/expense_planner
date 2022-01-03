import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    final themeStyle = Theme.of(context);
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
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text("\$${transaction.amount}")),
          ),
        ),
        title: Text(
          transaction.title,
          style: themeStyle.textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                textColor: themeStyle.errorColor,
                icon: const Icon(Icons.delete),
                label: const Text("Delete"),
                onPressed: () {
                  deleteTx(transaction.id);
                },
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: themeStyle.errorColor,
                onPressed: () {
                  deleteTx(transaction.id);
                },
              ),
      ),
    );
  }
}