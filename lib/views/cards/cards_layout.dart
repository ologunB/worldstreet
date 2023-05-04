import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/cards/card_details.dart';
import 'package:ft_worldstreet/views/cards/create_card_view.dart';

import '../widgets/custom_text.dart';

class CardLayout extends StatefulWidget {
  const CardLayout({Key? key}) : super(key: key);

  @override
  State<CardLayout> createState() => _CardLayoutState();
}

class _CardLayoutState extends State<CardLayout> {
  int cardState = 0;
  Timer? _timer;
  @override
  void initState() {
    _timer = Timer(Duration(seconds: 4), () {
      cardState = 1;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RegularText(
          'Cards',
          fontSize: 18.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: [CreateCardScreen(), CardDetailsScreen()][cardState],
    );
  }
}
