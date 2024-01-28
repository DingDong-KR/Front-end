import 'package:flutter/material.dart';
import 'package:my_desktop_app/widgets/patients_list.dart';
import '../widgets/main_menu.dart';
import '../widgets/top_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  static const double mainMenuWidth = 122;
  static const double patientsListTopMargin = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
            children: [
              MainMenu(navigatorKey: _navigatorKey),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopBar(),
                  PatientsList(),
                  Navigator(
                    key: _navigatorKey,
                    onGenerateRoute: (settings) {
                      WidgetBuilder? builder;
                      switch (settings.name) {
                        case '/':
                          builder = (context) => Container();
                          break;
                      }
                      return MaterialPageRoute(
                        builder: builder!,
                        settings: settings,
                      );
                    },
                  ),
                ],
              ),
            ],
          )
    );
  }
}

