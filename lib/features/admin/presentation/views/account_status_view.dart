import 'package:flutter/material.dart';
import 'package:vales_app/features/shared/shared.dart';
import 'package:vales_app/features/shared/presentation/widgets/stat_row.dart';

class AccountStatusView extends StatelessWidget {
  const AccountStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            WhiteCard(
                child: Column(
              children: [
                Text("Sin información",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Divider(),
                SizedBox(height: 10),
                StatRow(description: "Vales canjeados", value: "10"),
                SizedBox(height: 5),
                StatRow(description: "Libera Calzado", value: "7"),
                SizedBox(height: 5),
                StatRow(description: "Libera Financiero", value: "18"),
                SizedBox(height: 15),
                StatRow(description: "Total a pagar", value: "\$1,000.00"),
                SizedBox(height: 50),
                Text("Descargas"),
                SizedBox(height: 10),
                _IconRow(description: "Estado de cuenta", icon: Icons.print),
                SizedBox(height: 5),
                _IconRow(description: "Recibos de clientes", icon: Icons.print),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Envío de whatsapp", style: TextStyle(fontSize: 16)),
                    Image(
                        image: AssetImage("assets/icons/whatsapp-black.png"),
                        width: 22)
                  ],
                )
              ],
            )),
            SizedBox(height: 20),
            WhiteCard(
                child: Column(
              children: [
                Text("Detalles de movimiento",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Divider(),
                Icon(Icons.money, size: 200, color: Colors.grey),
                Text(
                  "Por el momento no cuentas con detalles de movimientos",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )
              ],
            )),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}

class _IconRow extends StatelessWidget {
  final String description;
  final IconData icon;

  const _IconRow({required this.description, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(description, style: const TextStyle(fontSize: 16)),
        Icon(icon)
      ],
    );
  }
}
