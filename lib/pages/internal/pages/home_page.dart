import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      bottomNavigationBar: NavigationBar(
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
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
