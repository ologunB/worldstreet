import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class FundAccountScreen extends StatefulWidget {
  const FundAccountScreen({Key? key}) : super(key: key);

  @override
  State<FundAccountScreen> createState() => _FundAccountScreenState();
}

class _FundAccountScreenState extends State<FundAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.h),
        child: GeneralButton(
          'Share Account Details',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 16.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w500,
          onPressed: () {},
        ),
      ),
      backgroundColor: AppColors.baground,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RegularText(
                'NGN Account',
                fontSize: 18.sp,
                color: Colors.black,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(width: 10.h),
              Image.asset('assets/icons/ng.png', height: 24.h),
            ],
          )),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          Container(
            height: 130.h,
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 3,
                  spreadRadius: 3,
                )
              ],
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: Stack(
              children: [
                Image.asset(
                  'assets/icons/icon.png',
                  height: 22.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: RegularText(
                    '₦75,033',
                    fontSize: 24.sp,
                    color: Colors.black,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22.h),
          RegularText(
            'You can add funds to any of the accounts below using a bank transfer',
            fontSize: 14.sp,
            textAlign: TextAlign.center,
            color: Colors.black,
          ),
          SizedBox(height: 47.h),
          Container(
            padding: EdgeInsets.all(24.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.h),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.05),
                  blurRadius: 3,
                  spreadRadius: 3,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                c('Account Name', 'Adedeji Daniel'),
                Divider(height: 0, color: Color(0xffEDF0F4)),
                c('Bank Name', 'Sterling Bank'),
                Divider(height: 0, color: Color(0xffEDF0F4)),
                c('Account Number', '7828847090'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget c(String a, String b) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            RegularText(
              a,
              fontSize: 14.sp,
              color: Color(0xffCDCDCD),
            ),
            SizedBox(height: 6.h),
            RegularText(
              b,
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 12.h),
          ],
        ),
        Spacer(),
        Image.asset('assets/icons/copy.png', height: 18.h)
      ],
    );
  }
}
