import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/auth/add_binance_view.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/utils.dart';

class SelectSpaceScreen extends StatefulWidget {
  const SelectSpaceScreen({Key? key}) : super(key: key);

  @override
  State<SelectSpaceScreen> createState() => _SelectSpaceScreenState();
}

class _SelectSpaceScreenState extends State<SelectSpaceScreen> {
  int? space;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.black),
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.h),
        child: GeneralButton(
          'Continue',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 14.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w600,
          onPressed: () {
            if (space == 1) {
              pushReplacement(context, AddBinanceScreen());
            }
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24.h),
          children: [
            RegularText(
              'Select space',
              fontSize: 24.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 17.h),
            RegularText(
              'Select the market you want to trade in',
              fontSize: 14.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            space = 0;
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
                                border: space == 0
                                    ? null
                                    : Border.all(
                                        color: AppColors.lightGrey,
                                        width: 1.5.h),
                                boxShadow: space == 0
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
                      if (space == 0)
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
                            space = 1;
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
                                border: space == 1
                                    ? null
                                    : Border.all(
                                        color: AppColors.lightGrey,
                                        width: 1.5.h),
                                boxShadow: space == 1
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
                      if (space == 1)
                        Image.asset('assets/icons/mark.png', height: 24.h),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            if (space == 0)
              RegularText(
                'The Forex Market is the largest financial market in the world. With over 5trillion dollars transacted daily, and traders including governments, banks, and top institutions and investors all around the world, it is one of the most assured means to start building the generational wealth you dream. However, it is not a get rich quick scheme. Hence, as a trader, we recommend you use our Trader’s Table to analyse and plan your trade. As a none trader, we recommend you go over the profile of these top traders and copy-trade the one profitable enough and the one you are most comfortable with.',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.dGrey,
              ),
            if (space == 1)
              RegularText(
                'From Dec 2021, the number of people transacting with crypto currencies is over 300million. With multiple adoptions globally, by individuals and organizations, and over 30billion dollars trading volume, crypto currency is surely one of the best ways you can become a millionaire. However, it is not a get rich quick scheme. Hence, as a trader, we recommend you use our Trader’s Table to analyse and plan your trade. As a none trader, we recommend you go over the profile of these top traders and copy-trade the one profitable enough and the one you are most comfortable with.',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.dGrey,
              ),
          ],
        ),
      ),
    );
  }
}
