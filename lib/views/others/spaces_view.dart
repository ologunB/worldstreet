import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class SpacesView extends StatefulWidget {
  const SpacesView({Key? key}) : super(key: key);

  @override
  State<SpacesView> createState() => _SpacesViewState();
}

class _SpacesViewState extends State<SpacesView> {
  List<int> spaces = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.h),
        child: SafeArea(
          child: GeneralButton(
            'Switch',
            buttonColor: AppColors.skyBlue,
            borderColor: AppColors.skyBlue,
            borderRadius: 16.h,
            fontSize: 16.sp,
            height: 56.h,
            textColor: AppColors.white,
            fontWeight: FontWeight.w600,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 6.h),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 24.h,
              color: Colors.black,
            ),
          ),
        ),
        title: RegularText(
          'Spaces',
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          Row(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (spaces.contains(0)) {
                            spaces.remove(0);
                          } else {
                            spaces.add(0);
                          }
                        });
                      },
                      splashColor: Colors.white,
                      highlightColor: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: 170.h,
                            padding: EdgeInsets.all(32.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.h),
                              border: spaces.contains(0)
                                  ? null
                                  : Border.all(
                                      color: AppColors.lightGrey, width: 1.5.h),
                              boxShadow: spaces.contains(0)
                                  ? [
                                      BoxShadow(
                                        color: AppColors.lightGrey
                                            .withOpacity(0.3),
                                        spreadRadius: 6.h,
                                        blurRadius: 10.h,
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Image.asset('assets/icons/d0.png',
                                height: 88.h),
                          ),
                          SizedBox(height: 16.h),
                          RegularText(
                            'Forex',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.dGrey,
                          ),
                        ],
                      ),
                    ),
                    if (spaces.contains(0))
                      Image.asset('assets/icons/mark.png', height: 24.h),
                  ],
                ),
              ),
              SizedBox(width: 30.h),
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (spaces.contains(1)) {
                            spaces.remove(1);
                          } else {
                            spaces.add(1);
                          }
                        });
                      },
                      splashColor: Colors.white,
                      highlightColor: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: 170.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.h),
                              border: spaces.contains(1)
                                  ? null
                                  : Border.all(
                                      color: AppColors.lightGrey, width: 1.5.h),
                              boxShadow: spaces.contains(1)
                                  ? [
                                      BoxShadow(
                                        color: AppColors.lightGrey
                                            .withOpacity(0.3),
                                        spreadRadius: 6.h,
                                        blurRadius: 10.h,
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Image.asset('assets/icons/d1.png',
                                height: 88.h),
                          ),
                          SizedBox(height: 16.h),
                          RegularText(
                            'Crypto',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.dGrey,
                          ),
                        ],
                      ),
                    ),
                    if (spaces.contains(1))
                      Image.asset('assets/icons/mark.png', height: 24.h),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),
          if (spaces.contains(0))
            RegularText(
              'The Forex Market is the largest financial market in the world. With over 5trillion dollars transacted daily, and traders including governments, banks, and top institutions and investors all around the world, it is one of the most assured means to start building the generational wealth you dream. However, it is not a get rich quick scheme. Hence, as a trader, we recommend you use our Trader’s Table to analyse and plan your trade. As a none trader, we recommend you go over the profile of these top traders and copy-trade the one profitable enough and the one you are most comfortable with.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.dGrey,
            ),
          SizedBox(height: 20.h),
          if (spaces.contains(1))
            RegularText(
              'From Dec 2021, the number of people transacting with crypto currencies is over 300million. With multiple adoptions globally, by individuals and organizations, and over 30billion dollars trading volume, crypto currency is surely one of the best ways you can become a millionaire. However, it is not a get rich quick scheme. Hence, as a trader, we recommend you use our Trader’s Table to analyse and plan your trade. As a none trader, we recommend you go over the profile of these top traders and copy-trade the one profitable enough and the one you are most comfortable with.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.dGrey,
            ),
        ],
      ),
    );
  }
}
