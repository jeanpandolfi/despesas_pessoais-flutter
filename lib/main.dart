
import 'dart:math';

import 'package:despesas_pessoais_app/components/transaction_form.dart';
import 'package:despesas_pessoais_app/components/transaction_list.dart';
import 'package:despesas_pessoais_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(DespesasApp());
}

class DespesasApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage()
    );
  }

}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

  MyHomePage();
}

class _MyHomePageState extends State<MyHomePage>{

  final List<Transaction> _transactions = [
    Transaction(id: 't1', title: 'Novo tênis de corrida', value: 310.76, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de luz', value: 211.30, date: DateTime.now())
  ];

  void _addTransaction(String title, double value){
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState((){
      this._transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void _openTransactionForModal(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return TransactionForm(
            onSubmit: _addTransaction,
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas pessoais'),
        actions: [
          IconButton(
              icon: Icon(Icons.add), 
              onPressed: () => _openTransactionForModal(context)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                child: Text('Gráfico'),
                color: Colors.blue,
                elevation: 5,
              ),
            ),
            TransactionList(
              transactions: _transactions,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionForModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

