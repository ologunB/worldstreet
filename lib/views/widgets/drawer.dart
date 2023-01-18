import 'package:flutter/material.dart';
import 'package:ft_worldstreet/core/storage/local_storage.dart';
import 'package:ft_worldstreet/views/auth/onboard_view.dart';
import 'package:ft_worldstreet/views/others/spaces_view.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import '../auth/select_space_view.dart';
import '../others/profile_view.dart';
import 'custom_text.dart';
import 'floating_navbar.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

int sideBarIndex = 0;

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext cContext) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Row(
            children: [
              SizedBox(width: 20.h),
              SafeArea(
                bottom: false,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(cContext);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 24.h,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(32.h),
            child: Row(
              children: [
                Image.asset('assets/icons/face.png', height: 40.h),
                SizedBox(width: 14.h),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegularText(
                        'Hi Feyintola!',
                        color: AppColors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 4.h),
                      RegularText(
                        'Nigeria',
                        color: AppColors.skyBlue,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
              itemCount: types.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (c, i) {
                String name = types[i];
                return ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(left: 12.h),
                    child: Image.asset(
                      'assets/icons/$name.png',
                      height: 24.h,
                      color: sideBarIndex == i
                          ? AppColors.skyBlue
                          : AppColors.dGrey,
                    ),
                  ),
                  minLeadingWidth: 0,
                  title: RegularText(
                    name,
                    color:
                        sideBarIndex == i ? AppColors.skyBlue : AppColors.dGrey,
                    fontSize: 16.sp,
                    fontWeight:
                        sideBarIndex == i ? FontWeight.w600 : FontWeight.w400,
                  ),
                  onTap: () async {
                    sideBarIndex = i;
                    setState(() {});

                    if (name == 'Home') {
                      bottomNavbarController.jumpToPage(0);
                    }
                    if (name == 'Leader') {
                      bottomNavbarController.jumpToPage(1);
                    }
                    if (name == 'World Talk') {
                      bottomNavbarController.jumpToPage(2);
                    }
                    if (name == 'Journal') {
                      bottomNavbarController.jumpToPage(3);
                    }
                    if (name == 'Profile') {
                      profileIndex = 0;
                      bottomNavbarController.jumpToPage(4);
                    }
                    if (name == 'Trade History') {
                      profileIndex = 2;
                      bottomNavbarController.jumpToPage(4);
                    }
                    if (name == 'Spaces') {
                      Navigator.pop(cContext);
                      push(context, const SpacesView());
                      return;
                    }
                    if (name == 'Market API') {
                      Navigator.pop(cContext);
                      push(context, const SelectSpaceScreen());
                      return;
                    }
                    if (name == 'Logout') {
                      AppCache.clear();
                      Navigator.pop(cContext);
                      pushAndRemoveUntil(context, const OnboardView());
                      return;
                    }
                    Navigator.pop(cContext);
                  },
                );
              }),
        ],
      ),
    );
  }

  List<String> get types => [
        'Home',
        'Leader',
        'World Talk',
        'Journal',
        'Profile',
        'Spaces',
        'Market API',
        'Trade History',
        'Nexa (Tour Guide)',
        'Logout',
      ];
}
