import 'package:despesas_pessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  TransactionList(this.transactions,this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                "Nenhuma Transação Cadastrada!,",
                style: Theme.of(context).textTheme.headline1,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                      child: FittedBox(
                        child: Text("R\$${tr.value}"),
                      ),
                    ),
                    title: Text(tr.title,style: Theme.of(context).textTheme.headline1,),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => onRemove(tr.id),
                      color: Theme.of(context).errorColor,
                    ) ,
                  ),
                ),
              );
            },
          );
  }
}
