import 'package:flutter/material.dart';
import 'package:vales_app/features/shared/shared.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          WhiteCard(
            child: Column(
              children: [
                const Icon(Icons.face_3, size: 150),
                const SizedBox(height: 30),
                const Text("Nombre"),
                const Text(
                  "Martha Araceli Graciano Arroyo",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 100),
                const Divider(),
                TextButton(
                  onPressed: () {},
                  child: const Text("Editar"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const WhiteCard(
            child: _ProfileCardInfo(
              text: "(461) 172-85-47",
              description: "Celular",
              icon: Icons.phone_android,
              edit: true,
            ),
          ),
          const SizedBox(height: 15),
          const WhiteCard(
            child: _ProfileCardInfo(
                text: "No definido",
                description: "Teléfono",
                icon: Icons.phone,
                edit: true),
          ),
          const SizedBox(height: 15),
          const WhiteCard(
            child: _ProfileCardInfo(
              text: "16/11/1995",
              description: "Fecha de cumpleaños",
              icon: Icons.cake,
              edit: false,
            ),
          ),
          const SizedBox(height: 15),
          WhiteCard(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Icon(
                      Icons.location_on_sharp,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text("Dirección"),
                    Text(
                      'TAMAULIPAS 100, Apartamento 107, Colonia Alameda CP 38050. Celaya, Celaya, Guanajuato.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          WhiteCard(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Icon(
                      Icons.lock,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text("NIP"),
                    const Text(
                      '****',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 100),
                    const Divider(),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Editar"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileCardInfo extends StatelessWidget {
  final IconData icon;
  final String description;
  final String text;
  final bool edit;

  const _ProfileCardInfo({
    required this.icon,
    required this.description,
    required this.text,
    this.edit = false,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(description),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 100),
            const Divider(),
            if (edit)
              TextButton(
                onPressed: () {},
                child: const Text("Editar"),
              ),
          ],
        ),
      ],
    );
  }
}
