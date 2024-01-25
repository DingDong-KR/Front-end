import 'package:flutter/material.dart';
import '../widgets/main_menu.dart';
import '../widgets/top_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MainMenu(navigatorKey: _navigatorKey),
          Expanded(
            // Right side containing TopBar and Navigator
            child: Column(
              children: [
                TopBar(),
                Expanded(
                  // Navigator takes the remaining space
                  child: Navigator(
                    key: _navigatorKey,
                    onGenerateRoute: (settings) {
                      WidgetBuilder? builder;
                      switch (settings.name) {
                        case '/':
                          builder = (context) =>
                              Container(); // TODO: Replace with default screen
                          break;
                      }
                      return MaterialPageRoute(
                          builder: builder!, settings: settings);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
