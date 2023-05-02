import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/settings/settings_view.dart';
import 'package:ft_worldstreet/views/widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cards/cards_layout.dart';
import 'home/home_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> get screens => [HomeScreen(), CardLayout(), SettingsScreen()];
  int currentIndex = 0;
  GlobalKey<ScaffoldState> mainLayoutScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      key: mainLayoutScaffoldKey,
      backgroundColor: AppColors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.greyDark1,
        iconSize: 20.h,
        selectedLabelStyle: GoogleFonts.kanit(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelStyle: GoogleFonts.kanit(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (i) {
          currentIndex = i;
          setState(() {});
        },
        items: List.generate(3, (i) => i)
            .map(
              (i) => BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/h$i.png',
                  height: 18.h,
                  width: 18.h,
                  color: AppColors.grey,
                ),
                activeIcon: Image.asset(
                  'assets/icons/h$i.png',
                  height: 18.h,
                  width: 18.h,
                  color: AppColors.black,
                ),
                label: ['Home', 'Cards', 'Settings'][i],
              ),
            )
            .toList(),
      ),
    );
  }
}
