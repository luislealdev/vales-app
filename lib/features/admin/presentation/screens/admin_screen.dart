import 'package:flutter/material.dart';
import 'package:vales_app/features/admin/presentation/widgets/AdminScaffold.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminScaffold(
      title: 'Inicio',
      body: Center(
        child: Text('Contenido de la página de inicio del administrador'),
      ),
    );
  }
}


// Define más páginas de administrador de manera similar
