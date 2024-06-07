import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(Icons.person_pin, size: 200),
                const SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Nombre"),
                    const Text(
                      'Martha Araceli Graciano Arroyo',
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
          const SizedBox(height: 15),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(Icons.person_pin, size: 200),
                const SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Nombre"),
                    const Text(
                      'Martha Araceli Graciano Arroyo',
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
