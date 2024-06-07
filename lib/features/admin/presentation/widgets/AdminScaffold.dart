import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vales_app/features/shared/shared.dart';

class AdminScaffold extends ConsumerStatefulWidget {
  final Widget body;
  final String title;

  const AdminScaffold({
    super.key,
    required this.body,
    required this.title,
  });

  @override
  AdminScaffoldState createState() => AdminScaffoldState();
}

class AdminScaffoldState extends ConsumerState<AdminScaffold> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      body: widget.body,
    );
  }
}
