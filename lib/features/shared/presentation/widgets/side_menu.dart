import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vales_app/features/auth/presentation/providers/auth_provider.dart';

class SideMenu extends ConsumerStatefulWidget {
  final int currentIndex;

  const SideMenu({required this.currentIndex, super.key});

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends ConsumerState<SideMenu> {
  late int navDrawerIndex;

  @override
  void initState() {
    super.initState();
    navDrawerIndex = widget.currentIndex;
  }

  void onItemTapped(int index, String url) {
    setState(() {
      navDrawerIndex = index;
    });

    if (url == "/home/13") {
      // Llamar al método logout
      ref.read(authProvider.notifier).logout();
    } else {
      context.go(url);
    }

    Navigator.of(context).pop(); // Cierra el Drawer
  }

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final textStyles = Theme.of(context).textTheme;

    final menuItems = [
      {'text': "Inicio", 'icon': Icons.home_outlined, 'url': "/home/0"},
      {'text': "Mi perfil", 'icon': Icons.person_outline, 'url': "/home/1"},
      {
        'text': "Estado de cuenta",
        'icon': Icons.monetization_on_outlined,
        'url': "/home/2"
      },
      {'text': "Clientes", 'icon': Icons.people_outline, 'url': "/home/3"},
      {
        'text': "Referencias Bancarias",
        'icon': Icons.credit_card_outlined,
        'url': "/home/4"
      },
      {
        'text': "Vale puntos",
        'icon': Icons.star_border_outlined,
        'url': "/home/5"
      },
      {'text': "Noticias", 'icon': Icons.newspaper_outlined, 'url': "/home/6"},
      {'text': "Vale conmigo", 'icon': Icons.school_outlined, 'url': "/home/7"},
      {'text': "Capacitación", 'icon': Icons.tag_faces_sharp, 'url': "/home/8"},
      {
        'text': "Vale electrónico",
        'icon': Icons.receipt_outlined,
        'url': "/home/9"
      },
      {
        'text': "Crédito revolvente",
        'icon': Icons.attach_money_outlined,
        'url': "/home/10"
      },
      {
        'text': "Centro de mensajes",
        'icon': Icons.message_outlined,
        'url': "/home/11"
      },
      {
        'text': "Notificaciones",
        'icon': Icons.notifications_active_outlined,
        'url': "/home/12"
      },
      {
        'text': "Cerrar sesión",
        'icon': Icons.output_outlined,
        'url': "/home/13"
      },
    ];

    final otherOptions = [
      {'text': "Contacto", 'icon': Icons.info_outline, 'url': "/home/14"},
      {
        'text': "Herramientas",
        'icon': Icons.engineering_outlined,
        'url': "/home/15"
      },
      {
        'text': "Términos y condiciones",
        'icon': Icons.backup_table_sharp,
        'url': "/home/16"
      },
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, hasNotch ? 100 : 20, 16, 0),
            child: Text('ValesApp', style: textStyles.titleMedium),
          ),
          for (int i = 0; i < menuItems.length; i++)
            ListTile(
              leading: Icon(menuItems[i]['icon'] as IconData),
              title: Text(menuItems[i]['text'] as String),
              selected: navDrawerIndex == i,
              onTap: () => onItemTapped(i, menuItems[i]['url'] as String),
            ),
          const Divider(),
          const ListTile(
            title: Text('Otras opciones'),
          ),
          for (int i = 0; i < otherOptions.length; i++)
            ListTile(
              leading: Icon(otherOptions[i]['icon'] as IconData),
              title: Text(otherOptions[i]['text'] as String),
              onTap: () => onItemTapped(i, otherOptions[i]['url'] as String),
            ),
          const SizedBox(height: 50),
          // Agrega más opciones aquí si es necesario
        ],
      ),
    );
  }
}
