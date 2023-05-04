import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/home/review_exchange_view.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/zoper_pinboard.dart';
import 'home_view.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RegularText(
          'Exchange Money',
          fontSize: 18.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RegularText(
                'Balance: ',
                fontSize: 14.sp,
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
              ),
              RegularText(
                '₦760,000',
                fontSize: 14.sp,
                color: Color(0xff23845B),
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          field('You Pay'),
          SizedBox(height: 18.h),
          Row(
            children: [
              Image.asset('assets/icons/e1.png', height: 30.h),
              SizedBox(width: 10.h),
              RegularText(
                'NGN 754 = USD 1.00',
                fontSize: 14.sp,
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Image.asset('assets/icons/e1.png', height: 30.h),
              SizedBox(width: 10.h),
              RegularText(
                'Exchange fee = ₦450',
                fontSize: 14.sp,
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              RegularText(
                'In USD - You’ll get ',
                fontSize: 14.sp,
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(width: 10.h),
              RegularText(
                '₦1,000',
                fontSize: 14.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          field('You Get'),
          SizedBox(height: 18.h),
          PinKeyboard(
            onConfirm: (a) {},
            onBiometric: () {},
            length: 4,
            onChange: (a) {},
          ),
          GeneralButton(
            'Continue',
            buttonColor: AppColors.skyBlue,
            borderColor: AppColors.skyBlue,
            borderRadius: 8.h,
            fontSize: 16.sp,
            height: 48.h,
            textColor: AppColors.white,
            fontWeight: FontWeight.w500,
            onPressed: () {
              push(context, ReviewExchangeScreen());
            },
          ),
        ],
      ),
    );
  }

  Widget field(String type) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.h),
        border: Border.all(color: Colors.black.withOpacity(.5)),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  builder: (a) {
                    return SelectAccount();
                  });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icons/us.png', height: 20.h),
                SizedBox(width: 3.h),
                RegularText(
                  'USD',
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                Icon(Icons.keyboard_arrow_down_rounded, size: 20.h),
              ],
            ),
          ),
          SizedBox(width: 20.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText(
                  type,
                  fontSize: 14.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
                CupertinoTextField(
                  decoration: BoxDecoration(color: Colors.transparent),
                  readOnly: true,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
