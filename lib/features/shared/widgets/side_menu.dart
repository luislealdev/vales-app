import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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

    context.go(url);
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
        'url': "/account_status"
      },
      {'text': "Clientes", 'icon': Icons.people_outline, 'url': "/clients"},
      {
        'text': "Referencias Bancarias",
        'icon': Icons.credit_card_outlined,
        'url': "/bank_references"
      },
      {
        'text': "Vale puntos",
        'icon': Icons.star_border_outlined,
        'url': "/vale_points"
      },
      {'text': "Noticias", 'icon': Icons.newspaper_outlined, 'url': "/news"},
      {
        'text': "Vale conmigo",
        'icon': Icons.school_outlined,
        'url': "/vale_with_me"
      },
      {
        'text': "Capacitación",
        'icon': Icons.tag_faces_sharp,
        'url': "/training"
      },
      {
        'text': "Vale electrónico",
        'icon': Icons.receipt_outlined,
        'url': "/electronic_vale"
      },
      {
        'text': "Crédito revolvente",
        'icon': Icons.attach_money_outlined,
        'url': "/revolving_credit"
      },
      {
        'text': "Centro de mensajes",
        'icon': Icons.message_outlined,
        'url': "/message_center"
      },
      {
        'text': "Notificaciones",
        'icon': Icons.notifications_active_outlined,
        'url': "/notifications"
      },
      {
        'text': "Cerrar sesión",
        'icon': Icons.output_outlined,
        'url': "/logout"
      },
    ];

    final otherOptions = [
      {'text': "Contacto", 'icon': Icons.info_outline, 'url': "/contact"},
      {
        'text': "Herramientas",
        'icon': Icons.engineering_outlined,
        'url': "/tools"
      },
      {
        'text': "Términos y condiciones",
        'icon': Icons.backup_table_sharp,
        'url': "/terms_and_conditions"
      },
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, hasNotch ? 100 : 20, 16, 0),
            child: Text('Saludos', style: textStyles.titleMedium),
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
