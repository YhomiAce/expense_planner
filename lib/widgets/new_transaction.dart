import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction) {
    print('Constructor New Transaction Widget');
  }

  @override
  _NewTransactionState createState() {
    print('createState NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  _NewTransactionState() {
    print('Constructor New Transaction State');
  }

  @override
  void initState() {
    print('InitState()');
    super.initState();
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('Dispose');
    super.dispose();
  }

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTransaction(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('....');
  }

  @override
  Widget build(BuildContext context) {
    final themeStyle = Theme.of(context);
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                // onChanged: (value) {
                //   titleInput = value;
                // },
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                // onChanged: (val) => amountInput = val,
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen!'
                        : 'Picked date: ${DateFormat.yMd().format(_selectedDate)}'),
                  ),
                  FlatButton(
                    textColor: themeStyle.primaryColor,
                    onPressed: _presentDatePicker,
                    child: Text(
                      "Choose Date",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ]),
              ),
              RaisedButton(
                onPressed: _submitData,
                // print(titleInput);
                //   // print(amountInput);
                //   print(titleController.text);
                //   print(amountController.text);
                //   addTransaction(
                //       titleController.text, double.parse(amountController.text));
                // },
                child: Text('Add Transaction'),
                color: themeStyle.primaryColor,
                textColor: themeStyle.textTheme.button.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
