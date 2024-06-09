import 'package:etec_tcc/pages/internal/pages/matters_page.dart';
import 'package:etec_tcc/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'pages/home_page.dart';

class RouteProvider extends StatefulWidget {
  const RouteProvider({super.key});

  @override
  State<RouteProvider> createState() => _RouteProviderState();
}

class _RouteProviderState extends State<RouteProvider> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final AuthService _authService = AuthService();
  int currentPageIndex = 0;
  String? routeDisplayName;

  @override
  void initState() {
    super.initState();
    routeDisplayName = 'Início';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(routeDisplayName ?? ''),
      ),
      bottomNavigationBar: _bottomNavigation(),
      body: Navigator(
        key: _navigatorKey,
        onGenerateRoute: _generateRoute,
      ),
    );
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    Widget page;
    String displayName;
    _authService.useBiometric().then((res) => print(res));
    switch (settings.name) {
      case '/matters':
        page = Container(
          color: Colors.transparent,
          child: const MattersPage(),
        );
        displayName = 'Matérias';
        break;
      // Adicione mais casos para outras rotas aqui
      case '/':
      default:
        page = Container(
          color: Colors.transparent,
          child: const HomePage(),
        );
        displayName = 'Início';
        break;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          routeDisplayName = displayName;
        });
      }
    });

    return MaterialPageRoute(
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: page,
      ),
      settings: RouteSettings(
        name: settings.name,
        arguments: {'displayName': displayName},
      ),
    );
  }

  Widget _bottomNavigation() {
    return NavigationBar(
      onDestinationSelected: (int index) => _onTap(index),
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
          icon: FaIcon(FontAwesomeIcons.solidBell),
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

  void _onTap(int tabIndex) {
    if (tabIndex == currentPageIndex) return;

    String routeName;
    switch (tabIndex) {
      case 0:
        routeName = '/';
        break;
      case 1:
        routeName = '/matters';
        break;
      case 2:
        routeName = '/notices';
        break;
      case 3:
        routeName = '/menu';
        break;
      case 4:
        routeName = '/student';
        break;
      default:
        routeName = '/';
        break;
    }

    _navigatorKey.currentState!.pushReplacementNamed(routeName);
    setState(() {
      currentPageIndex = tabIndex;
    });
  }
}
