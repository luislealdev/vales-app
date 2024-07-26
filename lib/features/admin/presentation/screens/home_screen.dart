import 'package:flutter/material.dart';
import 'package:vales_app/features/admin/admin.dart';
import 'package:vales_app/features/admin/presentation/views/account_status_view.dart';
import 'package:vales_app/features/admin/presentation/views/bank_references_view.dart';
import 'package:vales_app/features/admin/presentation/views/clients_view.dart';
import 'package:vales_app/features/admin/presentation/views/contact_view.dart';
import 'package:vales_app/features/admin/presentation/views/credit_view.dart';
import 'package:vales_app/features/admin/presentation/views/electronic_coupon_view.dart';
import 'package:vales_app/features/admin/presentation/views/learning_view.dart';
import 'package:vales_app/features/admin/presentation/views/message_center_view.dart';
import 'package:vales_app/features/admin/presentation/views/news_view.dart';
import 'package:vales_app/features/admin/presentation/views/notificacions_view.dart';
import 'package:vales_app/features/admin/presentation/views/points_view.dart';
import 'package:vales_app/features/admin/presentation/views/terms_conditions_view.dart';
import 'package:vales_app/features/admin/presentation/views/tools_view.dart';
import 'package:vales_app/features/admin/presentation/views/with_me_view.dart';
import 'package:vales_app/features/shared/presentation/widgets/side_menu.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//* Este Mixin es necesario para mantener el estado en el PageView
class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final viewRoutes = const <Widget>[
    HomeView(),
    ProfileView(),
    AccountStatusView(),
    ClientsView(),
    BankReferencesView(),
    PointsView(),
    NewsView(),
    WithMeView(),
    LearningView(),
    ElectronicCouponView(),
    CreditView(),
    MessageCenterView(),
    NotificacionsView(),
    Text("Close sesion"),
    ContactView(),
    ToolsView(),
    TermsConditionsView()
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (pageController.hasClients) {
      pageController.animateToPage(
        widget.pageIndex,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      );
    }

    return Scaffold(
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
      drawer: SideMenu(currentIndex: widget.pageIndex),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape:
            ShapeBorder.lerp(const CircleBorder(), const StadiumBorder(), 0.5),
        onPressed: () {},
        child: const Image(
            image: AssetImage("assets/icons/whatsapp.png"),
            height: 30,
            width: 30),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        // index: pageIndex,
        children: viewRoutes,
      ),
      // bottomNavigationBar: CustomBottomNavigation(
      //   currentIndex: widget.pageIndex,
      // ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
