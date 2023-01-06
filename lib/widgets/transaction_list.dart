import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function _deleteTx;
  TransactionList(this.transactions, this._deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FittedBox(
                            child: Text('\$${transactions[index].amount}'),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Theme.of(context).errorColor,
                        ),
                        onPressed: () => _deleteTx(transactions[index].id),
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
