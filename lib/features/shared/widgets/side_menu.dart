import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends ConsumerState<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final textStyles = Theme.of(context).textTheme;

    final menuItems = [
      {'text': "Inicio", 'icon': Icons.home_outlined, 'url': "/"},
      {'text': "Mi perfil", 'icon': Icons.person_outline, 'url': "/profile"},
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
      {
        'text': "Cerrar sesión",
        'icon': Icons.output_outlined,
        'url': "/logout"
      },
    ];

    List<NavigationDrawerDestination> navigationDestinations = menuItems
        .map((item) => NavigationDrawerDestination(
              icon: Icon(item['icon'] as IconData),
              label: Text(item['text'] as String),
            ))
        .toList();

    return NavigationDrawer(
      elevation: 1,
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        // Navegar a la URL correspondiente
        final menuItem = menuItems[value];
        context.push(menuItem['url'] as String);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, hasNotch ? 30 : 20, 16, 0),
          child: Text('Saludos', style: textStyles.titleMedium),
        ),
        ...navigationDestinations.take(13), // Toma los primeros 13 destinos

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('Otras opciones'),
        ),
        ...navigationDestinations.skip(13), // Toma los destinos restantes
      ],
    );
  }
}
