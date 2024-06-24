import 'package:etec_tcc/constants/constants.dart';
import 'package:etec_tcc/pages/external/login_page.dart';
import 'package:etec_tcc/pages/internal/pages/matters_page.dart';
import 'package:etec_tcc/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
  String? currentRoute = '/login';
  @override
  void initState() {
    super.initState();
    routeDisplayName = 'Início';
  }

  bool _isExternalRoute() {
    return currentRoute == '/login';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _isExternalRoute()
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: AppBar(
                toolbarHeight: 80,
                leading: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: const Icon(
                    LucideIcons.alignLeft,
                    color: ConstantsColors.primaryColor,
                  ),
                  iconSize: 38,
                  padding: const EdgeInsets.only(left: 15),
                  onPressed: () {
                    print('pressed menu');
                  },
                ),
                actions: const [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Wiliam Nicolau',
                            style: TextStyle(
                                color: ConstantsColors.primaryColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Estudante',
                            style: TextStyle(
                                color: ConstantsColors.primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                      Padding(padding: EdgeInsets.only(right: 16))
                    ],
                  )
                ],
              ),
            ),
      bottomNavigationBar: _isExternalRoute() ? null : _bottomNavigation(),
      body: Navigator(
        key: _navigatorKey,
        initialRoute: '/login',
        onGenerateRoute: _generateRoute,
      ),
    );
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    Widget page;
    String displayName;
    _authService.useBiometric().then((res) => print(res));
    switch (settings.name) {
      case '/login':
        page = LoginPage();
        displayName = 'Login';
        break;
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
          currentRoute = settings.name ?? '/';
        });
      }
    });

    return MaterialPageRoute(
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
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
      backgroundColor: Colors.white,
      elevation: 1, //0 pra deixar 100% branco
      indicatorColor: Colors.black12,
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
