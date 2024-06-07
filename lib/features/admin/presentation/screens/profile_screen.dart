import 'package:flutter/material.dart';
import 'package:vales_app/features/admin/presentation/widgets/AdminScaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminScaffold(
      title: 'Inicio',
      body: Center(
        child: Text('Contenido de la página de inicio de perfil'),
      ),
    );
  }
}


// Define más páginas de administrador de manera similar
