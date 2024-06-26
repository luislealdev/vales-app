// profile_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vales_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:vales_app/features/shared/shared.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    if (authState.authStatus != AuthStatus.authenticated ||
        authState.user == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final user = authState.user!;

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
                Text(
                  "${user.name} ${user.secondName} ${user.firstLastName} ${user.secondLastName}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
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
          WhiteCard(
            child: _ProfileCardInfo(
              text: user.phone,
              description: "Celular",
              icon: Icons.phone_android,
              edit: true,
            ),
          ),
          const SizedBox(height: 15),
          WhiteCard(
            child: _ProfileCardInfo(
              text:
                  "${user.address.street} ${user.address.number} ${user.address.neighborhood} ${user.address.city} ${user.address.state} ${user.address.zip}",
              description: "Dirección",
              icon: Icons.location_on_sharp,
              edit: false,
            ),
          ),
          // Add other profile cards here...
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
