import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/world_talk/world_talk_view.dart';
import '../journal/journal_view.dart';
import '../leader/leaders_view.dart';
import '../others/profile_view.dart';
import '../widgets/drawer.dart';
import '../widgets/floating_navbar.dart';
import 'home/home_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

GlobalKey<ScaffoldState> mainLayoutScaffoldKey = GlobalKey<ScaffoldState>();

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: mainLayoutScaffoldKey,
      drawer: const NavigationDrawer(),
      body: FloatingNavBar(
        items: [
          FloatingNavBarItem(img: 'Home', page: HomeScreen()),
          FloatingNavBarItem(img: 'Leader', page: const LeadersView()),
          FloatingNavBarItem(img: 'World Talk', page: const WorldTalkView()),
          FloatingNavBarItem(img: 'Journal', page: const JournalView()),
          FloatingNavBarItem(img: 'Profile', page: const ProfileView()),
        ],
      ),
    );
  }
}
