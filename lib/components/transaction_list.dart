import 'package:despesas_pessoais_app/components/transaction_form.dart';
import 'package:despesas_pessoais_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  const TransactionList({Key key, this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: this.transactions.length,
        itemBuilder: (ctx, index) {
          final tr = transactions[index];
          return Card(
              child: Row(
                children: [
                  Container(
                    child: Text(
                      'R\$ ${tr.value.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple
                      ),
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.purple,
                            width: 2
                        )
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                      Text(
                        DateFormat('d MMM y').format(tr.date),
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                ],
              )
          );
        },
      ),
    );
  }
}
