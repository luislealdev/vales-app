import 'package:flutter/material.dart';

class ClientsView extends StatelessWidget {
  const ClientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.face_retouching_off, size: 150),
        SizedBox(height: 10),
        Text(
          "Actualmente no tienes ningún cliente asignado",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
