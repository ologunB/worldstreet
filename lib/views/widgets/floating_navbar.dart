import 'package:flutter/material.dart';

import 'package:ft_worldstreet/views/widgets/custom_text.dart';

import '../others/profile_view.dart';
import 'drawer.dart';

class FloatingNavBar extends StatefulWidget {
  final List<FloatingNavBarItem> items;

  const FloatingNavBar({super.key, required this.items});

  @override
  FloatingNavBarState createState() => FloatingNavBarState();
}

PageController bottomNavbarController = PageController(initialPage: 0);

class FloatingNavBarState extends State<FloatingNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: bottomNavbarController,
              children: widget.items.map((item) => item.page).toList(),
              onPageChanged: (index) => _changePage(index),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20.h,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.h),
                ),
                child: Container(
                  height: 73.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.h),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.baground.withOpacity(.6),
                        blurRadius: 10.h,
                        spreadRadius: 5.h,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _widgetsBuilder(widget.items),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _floatingNavBarItem(FloatingNavBarItem item, int index) {
    return FutureBuilder(
      future: Future.value(true),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return InkWell(
          onTap: () => _changePage(index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/${item.img}.png',
                height: 24.h,
                width: 24.h,
                color: currentIndex == index
                    ? AppColors.skyBlue
                    : AppColors.black.withOpacity(.2),
              ),
              const SizedBox(height: 6),
              RegularText(
                item.img,
                color: currentIndex == index
                    ? AppColors.skyBlue
                    : AppColors.black.withOpacity(.2),
                fontSize: 13.sp,
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _widgetsBuilder(List<FloatingNavBarItem> items) {
    List<Widget> floatingNavBarItems = [];
    for (int i = 0; i < items.length; i++) {
      Widget item = _floatingNavBarItem(items[i], i);
      floatingNavBarItems.add(item);
    }
    return floatingNavBarItems;
  }

  _changePage(index) async {
    currentIndex = index;
    sideBarIndex = index;
    profileIndex = 0;
    bottomNavbarController.jumpToPage(index);
    setState(() {});
  }
}

void moveUp(ScrollController control) {
  if (control.hasClients) {
    control.animateTo(control.position.minScrollExtent - 60,
        curve: Curves.easeOut, duration: const Duration(milliseconds: 500));
  }
}

class FloatingNavBarItem {
  String img;
  Widget page;

  FloatingNavBarItem({required this.img, required this.page});
}

class RadiantGradientMask extends StatelessWidget {
  const RadiantGradientMask({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return child!;
  }
}
