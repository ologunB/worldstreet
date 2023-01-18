import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/home/main_layout.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import '../../core/storage/local_storage.dart';
import 'add_binance_view.dart';
import 'onboard_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      if (AppCache.getUser() == null) {
        pushReplacement(context, OnboardView());
      } else if (AppCache.getUser()?.binanceKey == null) {
        pushReplacement(context, AddBinanceScreen());
      } else {
        pushReplacement(context, MainLayout());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff102949),
      body: Center(
        child: Image.asset('assets/icons/logo.png', height: 100),
      ),
    );
  }
}
