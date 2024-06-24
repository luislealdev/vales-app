import 'package:flutter/material.dart';

class MessageCenterView extends StatelessWidget {
  const MessageCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Colors.blue, // Cambiar el color del texto del botón
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(9.0), // Ajustar el radio del borde
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book),
                  SizedBox(width: 15),
                  Text('Sugerencia de ventas'),
                ],
              ))
        ]));
  }
}
