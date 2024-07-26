import 'package:flutter/material.dart';
import 'package:vales_app/features/shared/shared.dart';
import 'package:vales_app/features/shared/presentation/widgets/stat_row.dart';

class PointsView extends StatelessWidget {
  const PointsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    Colors.blue, // Cambiar el color del texto del botón
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Ajustar el radio del borde
                ),
              ),
              child: const Text('Viajes +Óptica'),
            ),
            const SizedBox(
                height: 10), // Agregar espaciado vertical entre los botones
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Catálogo punto'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Calculadora de puntos'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Tarjeta de puntos'),
            ),
            const SizedBox(height: 30),
            const WhiteCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios_new, size: 25),
                  Text(
                    'MAYO 2024',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 30),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const WhiteCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("+Puntos"),
                  Divider(),
                  StatRow(description: "Al día de hoy", value: "35,000"),
                  StatRow(description: "Acumulado", value: "5,000"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
