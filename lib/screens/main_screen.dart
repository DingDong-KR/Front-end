import 'package:flutter/material.dart';
import '../screens_main/home_screen.dart';
import '../widgets/main_menu.dart';
import '../widgets/patients_list.dart';
import '../widgets/top_bar.dart';
import 'package:my_desktop_app/models/user.dart';

class MainScreen extends StatefulWidget {
  final User user;

  const MainScreen({required this.user, Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  int _selectedMenuIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2F1F6),
      body: Column(
        children: [
          MainMenu(
            navigatorKey: _navigatorKey,
            user: widget.user,
            onMenuSelected: (index) {
              setState(() {
                _selectedMenuIndex = index;
              });
            },
          ),
          Expanded(
            child: Row(
              children: [
                if (_selectedMenuIndex != 0)
                  const SizedBox(
                    width: 213,
                    child: PatientsList(),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3.0, 0.0, 3.0, 0.0),
                        child: TopBar(user: widget.user),
                      ),
                      Expanded(
                        child: Navigator(
                          key: _navigatorKey,
                          onGenerateRoute: (settings) {
                            WidgetBuilder? builder;
                            switch (settings.name) {
                              case '/':
                                builder =
                                    (context) => HomeScreen(user: widget.user);
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
