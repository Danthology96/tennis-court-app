import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';

/// Main Screen for the app
class MainScreen extends StatefulWidget {
  static const name = 'main';
  static const path = '/$name';

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        if (widget.navigationShell.currentIndex != 0) {
          widget.navigationShell.goBranch(0);
        } else {
          _onBackPressed(context);
        }
      },
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: isKeyboardOpen
            ? null
            : CustomBottomNavigationBar(
                navigationShell: widget.navigationShell),
      ),
    );
  }

  /// Function called when user taps the back button of the device, calls a
  /// confirmation to exit the application
  void _onBackPressed(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("Salir"),
          content: Text('¿Desea salir de la aplicación?'),
          // onConfirmPressed: () async {
          //   await SystemChannels.platform
          //       .invokeMethod<void>('SystemNavigator.pop');
          // },
        );
      },
    );
  }
}
