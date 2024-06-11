import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: const Row(
              children: [
                Icon(Icons.person_pin, size: 50),
                SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Araceli Medina',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Correo electrónico del administrador',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: const Column(
                children: [
                  Text("Saldo global disponible", textAlign: TextAlign.left),
                  Divider(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("\$50,000.00", style: TextStyle(fontSize: 20)),
                          Text("Saldo disponible \n para tienda",
                              textAlign: TextAlign.center),
                        ],
                      ),
                      Column(
                        children: [
                          Text("\$50,000.00", style: TextStyle(fontSize: 20)),
                          Text("Saldo disponible \n para financiero",
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
          const SizedBox(height: 15),
          Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: const Column(children: [
                Text("Información no disponible"),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Información no disponible"),
                  ],
                ),
              ])),
          const SizedBox(height: 15),
          Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: const Column(children: [
                Text("Fechas importantes"),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Información no disponible"),
                  ],
                ),
              ])),
          const SizedBox(height: 15),
          Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: const Column(children: [
                Text("Préstamo personal"),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("No disponible"),
                  ],
                ),
              ])),
          const SizedBox(height: 15),
          Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: const Column(children: [
                Text("Tabla de porcentaje de bonificación"),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Información no disponible"),
                  ],
                ),
              ])),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}


// Define más páginas de administrador de manera similar
