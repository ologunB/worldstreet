import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ItsyText(
          'MainLayout',
          color: AppColors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(height: 20.h),
          ItsyText(
            'MainLayout is working',
            color: AppColors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
