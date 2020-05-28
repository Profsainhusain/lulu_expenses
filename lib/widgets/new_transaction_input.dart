import 'package:flutter/material.dart';


class NewTransactionInput extends StatefulWidget {
  final Function addTransaction;

  NewTransactionInput(this.addTransaction);

  @override
  _NewTransactionInputState createState() => _NewTransactionInputState();
}

class _NewTransactionInputState extends State<NewTransactionInput> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  
  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }
    widget.addTransaction(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
//                    onChanged: (value) => inputTitle = value,
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
//                    onChanged: (value) => inputAmount = value,
              controller: amountController,
              onSubmitted: (_) => submitData(),
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Add Expenses'),
              textColor: Colors.black,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
