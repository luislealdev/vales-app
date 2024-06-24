import 'package:flutter/material.dart';

class NotificacionsView extends StatefulWidget {
  const NotificacionsView({super.key});

  @override
  _NotificacionsViewState createState() => _NotificacionsViewState();
}

class _NotificacionsViewState extends State<NotificacionsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: false, // Fijar el TabBar para que no sea deslizable
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.blue,
          labelStyle: const TextStyle(fontSize: 14),
          tabs: const [
            Tab(
              icon: Icon(Icons.new_releases,
                  size: 18), // Icono para la pestaña "Nuevos"
              text: 'Nuevos',
            ),
            Tab(
              icon: Icon(Icons.local_mall,
                  size: 18), // Icono para la pestaña "Ventas"
              text: 'Ventas',
            ),
            Tab(
              icon: Icon(Icons.compare_arrows,
                  size: 18), // Icono para la pestaña "Revales"
              text: 'Revales',
            ),
            Tab(
              icon: Icon(Icons.arrow_back,
                  size: 18), // Icono para la pestaña "Devoluciones"
              text: 'Devoluciones',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              NotificationsList(
                  notifications: _getNotificationsForCategory('Nuevos')),
              NotificationsList(
                  notifications: _getNotificationsForCategory('Ventas')),
              NotificationsList(
                  notifications: _getNotificationsForCategory('Revales')),
              NotificationsList(
                  notifications: _getNotificationsForCategory('Devoluciones')),
            ],
          ),
        ),
      ],
    );
  }

  List<Notification> _getNotificationsForCategory(String category) {
    // Aquí puedes agregar lógica para obtener las notificaciones de la categoría especificada desde tu base de datos
    return [
      Notification(
        category: category,
        title: 'Notificación 1',
        description: 'Descripción de la notificación 1',
      ),
      Notification(
        category: category,
        title: 'Notificación 2',
        description: 'Descripción de la notificación 2',
      ),
    ];
  }
}

class NotificationsList extends StatelessWidget {
  final List<Notification> notifications;

  const NotificationsList({Key? key, required this.notifications})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return ListTile(
          title: Text(notification.title),
          subtitle: Text(notification.description),
        );
      },
    );
  }
}

class Notification {
  final String category;
  final String title;
  final String description;

  Notification({
    required this.category,
    required this.title,
    required this.description,
  });
}
