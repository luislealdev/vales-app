import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vales_app/features/shared/shared.dart';

class ElectronicCouponView extends StatelessWidget {
  const ElectronicCouponView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Búsqueda',
                      hintText: 'Búsqueda',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const _CouponInfo()
          ],
        ),
      ),
    );
  }
}

class _CouponInfo extends StatelessWidget {
  const _CouponInfo();

  @override
  Widget build(BuildContext context) {
    return const WhiteCard(
      child: Row(
        children: [
          Icon(Icons.receipt, size: 35),
          SizedBox(width: 10), // Añadido para espacio entre el icono y el texto
          Flexible(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alineación a la izquierda
              children: [
                _FormatedText(
                  description: 'Id',
                  text: '123456',
                ),
                _FormatedText(
                  description: 'Cliente',
                  text: 'Martha Araceli Bla bla',
                ),
                _FormatedText(
                  description: 'Tipo',
                  text: 'Calzado \$5000',
                ),
                _FormatedText(
                  description: 'Fecha',
                  text: '20/05/2024',
                ),
                _FormatedText(
                  description: 'Teléfono',
                  text: '4611725634',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _FormatedText extends StatelessWidget {
  final String description;
  final String text;

  const _FormatedText({required this.description, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 18, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text: '$description: ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: text),
          ],
        ),
      ),
    );
  }
}
