import 'package:flutter/material.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const name = 'home';
  static const path = '/$name';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CustomAppBar(),
      body: const Center(
        child: Text('Home Page'),
      ),
      endDrawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}
