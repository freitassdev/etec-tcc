import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pages/home_page.dart';
import 'pages/food_menu_page.dart';
import 'pages/user_page.dart';
import 'pages/matters_page.dart';

class RouteProvider extends StatefulWidget {
  const RouteProvider({super.key});

  @override
  State<RouteProvider> createState() => _RouteProviderState();
}

class _RouteProviderState extends State<RouteProvider> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Route<dynamic> generateRoute(RouteSettings settings) {
      switch (settings.name) {
        case "home":
          return MaterialPageRoute(
              builder: (context) => const HomePage());
        case "matters":
          return MaterialPageRoute(
              builder: (context) => Container(
                  color: Colors.green, child: Center(child: Text("Settings"))));
        default:
          return MaterialPageRoute(
              builder: (context) => Container(
                  color: Colors.white, child: Center(child: Text("Home"))));
      }
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      bottomNavigationBar: _bottomNavigation(),
      body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
    );
  }

  Widget _bottomNavigation() {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      indicatorColor: Colors.blue[200],
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.house),
          label: 'Início',
        ),
        NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.solidClock),
          label: 'Horários',
        ),
        NavigationDestination(
          icon: Badge(child: FaIcon(FontAwesomeIcons.solidBell)),
          label: 'Avisos',
        ),
        NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.utensils),
          label: 'Cardápio',
        ),
        NavigationDestination(
          icon: FaIcon(FontAwesomeIcons.graduationCap),
          label: 'Aluno',
        ),
      ],
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState!.pushReplacementNamed("home");
        break;
      case 1:
        _navigatorKey.currentState!.pushReplacementNamed("matters");
        break;
      case 2:
        _navigatorKey.currentState!.pushReplacementNamed("food");
        break;
    }
    setState(() {
      currentPageIndex = tabIndex;
    });
  }
}

//https://stackoverflow.com/questions/45235570/how-to-use-bottomnavigationbar-with-navigator