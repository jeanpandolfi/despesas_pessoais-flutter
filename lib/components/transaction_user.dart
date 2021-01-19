import 'dart:math';

import 'package:despesas_pessoais_app/components/transaction_form.dart';
import 'package:despesas_pessoais_app/components/transaction_list.dart';
import 'package:despesas_pessoais_app/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(
          transactions: _transactions,
        ),
        TransactionForm(
          onSubmit: (title, value) => this._addTransaction(title, value),
        )
      ],
    );
  }
}
