import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Contact View', style: TextStyle(fontSize: 30)),
          const SizedBox(height: 10),
          const Text("Si necesitas ayuda, ¡Llámanos!"),
          const SizedBox(height: 10),
          const Text("Teléfono: 123456789 (opción 3)"),
          // Button to call
          TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 5),
                  Text("Llamar ahora"),
                ],
              )),
        ],
      ),
    );
  }
}
