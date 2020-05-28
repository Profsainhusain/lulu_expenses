import 'package:flutter/material.dart';

import './widgets/new_transaction_input.dart';
import './widgets/transaction_list.dart';
import './model/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LuLu Expns',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.pinkAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w800,
                fontSize: 16.0,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
        ),
      ),
      home: MyHomePage(title: 'LuLu Expenses'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
//    Transaction(
//      id: 't1',
//      title: 'Gas Refill',
//      amount: 1000.0,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'Salah Chicken',
//      amount: 2500.0,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't3',
//      title: 'Family outing',
//      amount: 20000.0,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't4',
//      title: 'New Shoes',
//      amount: 10000.0,
//      date: DateTime.now(),
//    ),
  ];
  //void method to add new transaction input
  void _addNewTransaction(String txtTitle, double txtAmount) {
    final newTransaction = Transaction(
      title: txtTitle,
      amount: txtAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransactionInput(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              height: 40.0,
              child: Card(
                elevation: 5.0,
                color: Colors.yellow,
                child: Text(
                  'Chart Section',
                ),
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
