import 'package:flutter/material.dart';

import '../widgets/amount_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import 'leaders_view.dart';

class CopyLeaderView extends StatefulWidget {
  const CopyLeaderView({Key? key}) : super(key: key);

  @override
  State<CopyLeaderView> createState() => _CopyLeaderViewState();
}

class _CopyLeaderViewState extends State<CopyLeaderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
        children: [
          RegularText(
            'Copy Trade',
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          SizedBox(height: 24.h),
          const LeaderItem(i: 1),
          SizedBox(height: 16.h),
          GeneralButton(
            'Stake Amount',
            buttonColor: AppColors.lightBlue,
            borderColor: AppColors.lightBlue,
            borderRadius: 8.h,
            fontSize: 14.sp,
            height: 40.h,
            textColor: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 12.h),
          StakeField(title: 'Stake Amount', amountChanged: (a) {}),
          StakeField(
            title: 'Taker Profit',
            amountChanged: (a) {},
            currencyChanged: (a) {},
          ),
          StakeField(
            title: 'Stop Loss',
            amountChanged: (a) {},
            currencyChanged: (a) {},
          ),
          SizedBox(height: 32.h),
          GeneralButton(
            'Copy Trader',
            buttonColor: AppColors.skyBlue,
            borderColor: AppColors.skyBlue,
            borderRadius: 8.h,
            fontSize: 16.sp,
            height: 50.h,
            textColor: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
