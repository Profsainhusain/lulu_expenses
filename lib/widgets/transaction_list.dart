import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
      child: Container(
        height: 400,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    'No Expenses Record. Add New!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    height: 300,
                    child: Image.asset(
                      'assets/images/images.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
//                  return Card(
//                    elevation: 6,
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: [
//                        Container(
//                          child: Text(
//                            'N${transactions[index].amount.toStringAsFixed(2)}',
//                            style: TextStyle(
//                              fontSize: 18.0,
//                              fontWeight: FontWeight.bold,
//                              color: Theme.of(context).primaryColor,
//                            ),
//                          ),
//                          margin: EdgeInsets.symmetric(
//                            vertical: 10.0,
//                            horizontal: 15.0,
//                          ),
//                          padding: EdgeInsets.all(10.0),
//                          decoration: BoxDecoration(
//                            border: Border.all(
//                              color: Theme.of(context).primaryColor,
//                              width: 2.0,
//                            ),
//                            borderRadius: BorderRadius.circular(5.0),
//                          ),
//                        ),
//                        SizedBox(
//                          width: 12.0,
//                        ),
//                        Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: [
//                              Text(
//                                transactions[index].title,
//                                style: Theme.of(context).textTheme.subtitle1,
//                            ),
//                            Text(
//                              DateFormat.yMMMd()
//                                  .format(transactions[index].date),
//                              style: TextStyle(
//                                fontSize: 10.0,
//                                color: Colors.grey[500],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                  );
                  return Card(
                    elevation: 5.0,
                    margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                            child: Text(
                                'N${transactions[index].amount.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: IconButton(
                        onPressed: () => deleteTransaction(transactions[index].id),
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
      ),
    );
  }
}
