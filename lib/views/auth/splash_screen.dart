import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

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
      pushReplacement(context, OnboardView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff102949),
      body: Center(
        child: Image.asset(
          'assets/icons/logo.png',
          height: 100,
        ),
      ),
    );
  }
}
