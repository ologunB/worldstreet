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
          fontSize: 17.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          field('You Pay'),
          SizedBox(height: 6.h),
          RegularText(
            'Your NGN Balance is 760,000',
            fontSize: 12.sp,
            color: Colors.black.withOpacity(.5),
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 18.h),
          Row(
            children: [
              CircleAvatar(
                radius: 10.h,
                backgroundColor: Color(0xff6BF581),
                child: Icon(Icons.add_rounded, size: 16.h),
              ),
              SizedBox(width: 10.h),
              RegularText(
                'NGN 754 = USD 1.00',
                fontSize: 14.sp,
                color: Colors.black.withOpacity(.5),
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          SizedBox(height: 18.h),
          Row(
            children: [
              CircleAvatar(
                radius: 10.h,
                backgroundColor: Color(0xff6BF581),
                child: Icon(Icons.add_rounded, size: 16.h),
              ),
              SizedBox(width: 10.h),
              RegularText(
                'Exchange fee = N450',
                fontSize: 14.sp,
                color: Colors.black.withOpacity(.5),
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          SizedBox(height: 18.h),
          field('You Get'),
          SizedBox(height: 18.h),
          GeneralButton(
            'Continue',
            buttonColor: Colors.black,
            borderColor: Colors.black,
            borderRadius: 8.h,
            fontSize: 17.sp,
            height: 42.h,
            textColor: AppColors.white,
            fontWeight: FontWeight.w600,
            onPressed: () {
              push(context, ReviewExchangeScreen());
            },
          ),
          SizedBox(height: 16.h),
          PinKeyboard(
            onConfirm: (a) {},
            onBiometric: () {},
            length: 4,
            onChange: (a) {},
          ),
        ],
      ),
    );
  }

  Widget field(String type) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.circular(10.h),
        border: Border.all(
          color: Colors.black.withOpacity(.5),
        ),
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
                  color: Colors.black.withOpacity(.5),
                  fontWeight: FontWeight.w700,
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
