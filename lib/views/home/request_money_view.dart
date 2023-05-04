import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class RequestMoneyScreen extends StatefulWidget {
  const RequestMoneyScreen({Key? key}) : super(key: key);

  @override
  State<RequestMoneyScreen> createState() => _RequestMoneyScreenState();
}

class _RequestMoneyScreenState extends State<RequestMoneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.h),
        child: GeneralButton(
          'Share Link',
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
        title: RegularText(
          'Request money',
          fontSize: 18.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          SizedBox(height: 20.h),
          RegularText(
            'Get Paid via a link',
            fontSize: 18.sp,
            color: Colors.black,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 4.h),
          RegularText(
            'Share your link to get paid by anyone',
            fontSize: 16.sp,
            color: AppColors.greyDark1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 36.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 46.h),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 23.h,
                  backgroundColor: Color(0xff291CC0),
                  child: Image.asset('assets/icons/person.png'),
                ),
                SizedBox(height: 16.h),
                RegularText(
                  'Emmanuel o.',
                  fontSize: 18.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 6.h),
                RegularText(
                  '@emmanuelO',
                  fontSize: 14.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyDark1,
                ),
                SizedBox(height: 18.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.h),
                  decoration: BoxDecoration(
                    color: Color(0xffE7F4FD),
                    borderRadius: BorderRadius.circular(118.h),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: RegularText(
                          'https://useworldstreet.com/emmanuelo',
                          fontSize: 14.sp,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 8.h),
                      Image.asset(
                        'assets/icons/copy.png',
                        color: Colors.black,
                        height: 16.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}
