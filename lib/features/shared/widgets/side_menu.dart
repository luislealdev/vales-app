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

    return NavigationDrawer(
        elevation: 1,
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });

          // final menuItem = appMenuItems[value];
          context.push( '/profile' );
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, hasNotch ? 30 : 20, 16, 0),
            // child: Text('Saludos', style: textStyles.titleMedium),
          ),

          // Padding(
          //   padding: const EdgeInsets.fromLTRB(20, 0, 16, 10),
          //   child: Text('Tony Stark', style: textStyles.titleSmall ),
          // ),

          const NavigationDrawerDestination(
            icon: Icon(Icons.home_outlined),
            label: Text('Inicio'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.person_outline),
            label: Text('Mi perfil'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.monetization_on_outlined),
            label: Text('Estado de cuenta'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.people_outline),
            label: Text('Clientes'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.credit_card_outlined),
            label: Text('Referencias Bancarias'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.star_border_outlined),
            label: Text('Vale puntos'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.newspaper_outlined),
            label: Text('Noticias'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.school_outlined),
            label: Text('Vale conmigo'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.tag_faces_sharp),
            label: Text('Capacitación'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.receipt_outlined),
            label: Text('Vale electrónico'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.attach_money_outlined),
            label: Text('Crédito revolvente'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.message_outlined),
            label: Text('Centro de mensajes'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.notifications_active_outlined),
            label: Text('Notificaciones'),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('Otras opciones'),
          ),

          const NavigationDrawerDestination(
            icon: Icon(Icons.info_outline),
            label: Text('Contacto'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.engineering_outlined),
            label: Text('Herramientas'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.backup_table_sharp),
            label: Text('Términos y condiciones'),
          ),
          const NavigationDrawerDestination(
            icon: Icon(Icons.output_outlined),
            label: Text('Cerrar sesión'),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 20),
          //   child: CustomFilledButton(
          //     onPressed: () {
          //       ref.read(authProvider.notifier).logout();
          //     },
          //     text: 'Cerrar sesión'
          //   ),
          // ),
        ]);
  }
}
