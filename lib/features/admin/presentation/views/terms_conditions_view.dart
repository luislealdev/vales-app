import 'package:flutter/material.dart';

class TermsConditionsView extends StatelessWidget {
  const TermsConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            Text("Términos y condiciones."),
            SizedBox(height: 20.0),
            Text(
                "Esta página web es propiedad y está operado por [nombre del titular de la página web]. Estos Términos establecen los términos y condiciones bajo los cuales puedes usar nuestra página web y nuestros servicios. Esta página web ofrece a los visitantes [descripción de lo que se ofrece en la web]. Al acceder o usar la página web, aceptas haber leído, entendido y aceptado estar sujeto a estos Términos.")
          ],
        ));
  }
}
