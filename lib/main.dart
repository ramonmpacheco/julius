import 'package:flutter/material.dart';
import 'package:julius/components/transaction_user.dart';

main() => runApp(JuliusApp());

class JuliusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            TransactionUser()
          ],
        ));
  }
}
