import 'package:flutter/material.dart';
import 'package:vales_app/features/shared/widgets/side_menu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape:
            ShapeBorder.lerp(const CircleBorder(), const StadiumBorder(), 0.5),
        onPressed: () {},
        child: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.school)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.receipt)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.message)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.access_time_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_none)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_rounded))
        ],
      ),
      body: const Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
                    Row(
            children: [
              Text('Nombre: '),
              Text('Tony Stark'),
            ],
                    )
                  ]),
          )),
    );
  }
}
