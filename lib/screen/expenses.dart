import 'package:flutter/material.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Text('${index + 1}.'),
            title: Text('₹ ${(index + 2) * 100}'),
          ),
        );
      },
    );
  }
}
