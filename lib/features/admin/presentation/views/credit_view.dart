import 'package:flutter/material.dart';
import 'package:vales_app/features/shared/shared.dart';

class CreditView extends StatelessWidget {
  const CreditView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            WhiteCard(
                child: Column(
              children: [
                Text('Clientes para revolvente',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
                Icon(Icons.money, size: 200, color: Colors.grey),
                Text(
                  'Por el momento no cuentas con vales de revolvencia.',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20),
                )
              ],
            ))
          ],
        ));
  }
}
