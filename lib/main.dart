import 'package:despesas_pessoais_app/components/transaction_form.dart';
import 'package:despesas_pessoais_app/components/transaction_list.dart';
import 'package:despesas_pessoais_app/components/transaction_user.dart';
import 'package:despesas_pessoais_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

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

class MyHomePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Card(
              child: Text('Gráfico'),
              color: Colors.blue,
              elevation: 5,
            ),
          ),
          TransactionUser()
        ],
      )
    );
  }

  MyHomePage();
}

