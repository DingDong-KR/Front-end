import 'package:flutter/material.dart';
import '../widgets/main_menu.dart';
import '../widgets/patients_list.dart';
import '../widgets/top_bar.dart';
import 'package:my_desktop_app/models/user.dart';

class MainScreen extends StatefulWidget {
  final User user; // Update to accept User object
  const MainScreen({required this.user, Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2F1F6),
      body: Row(
        children: [
          MainMenu(navigatorKey: _navigatorKey, user: widget.user),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopBar(user: widget.user),
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 195, // 너비 명시해야 Navigator 정상작동
                        child: PatientsList(),
                      ),
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
          ),
        ],
      ),
    );
  }
}
