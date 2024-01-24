import 'package:flutter/material.dart';
import '../widgets/main_menu.dart';

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
            child: Navigator(
              key: _navigatorKey,
              onGenerateRoute: (settings) {
                WidgetBuilder? builder;
                // Set the initial route based on your default screen
                switch (settings.name) {
                  case '/':
                    builder = (context) => Container(); // Replace with your default screen
                    break;
                // Add other routes as needed
                }

                return MaterialPageRoute(builder: builder!, settings: settings);
              },
            ),
          ),
        ],
      ),
    );
  }
}
