import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class ReviewExchangeScreen extends StatefulWidget {
  const ReviewExchangeScreen({Key? key}) : super(key: key);

  @override
  State<ReviewExchangeScreen> createState() => _ReviewExchangeScreenState();
}

class _ReviewExchangeScreenState extends State<ReviewExchangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.h),
        child: GeneralButton(
          'Continue',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 16.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w500,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.h),
                ),
                builder: (a) {
                  return Container(
                    padding: const EdgeInsets.all(20.0),
                    margin: EdgeInsets.symmetric(horizontal: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.h),
                        topRight: Radius.circular(12.h),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 14.h),
                        Image.asset('assets/icons/flare.png', height: 56.h),
                        SizedBox(height: 14.h),
                        RegularText(
                          r'$5.00',
                          fontSize: 20.sp,
                          color: Colors.black,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 10.h),
                        RegularText(
                          'was added from your USD balance in\n exchange for N3,900.00',
                          fontSize: 16.sp,
                          color: AppColors.grey,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 27.h),
                        GeneralButton(
                          'Done',
                          buttonColor: AppColors.skyBlue,
                          borderColor: AppColors.skyBlue,
                          borderRadius: 8.h,
                          fontSize: 16.sp,
                          height: 48.h,
                          textColor: AppColors.white,
                          fontWeight: FontWeight.w500,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(height: 14.h),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RegularText(
          'Review details',
          fontSize: 18.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'You are initiating a currency exchange from your',
                  style: GoogleFonts.poppins(
                    height: 1.5,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
                TextSpan(
                  text: ' NGN balance ',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
                TextSpan(
                  text: 'to your',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
                TextSpan(
                  text: ' USD balance ',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
                TextSpan(
                  text: ', Please confirm the details below and proceed.',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
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
                Padding(
                  padding: EdgeInsets.only(bottom: 18.h),
                  child: Row(
                    children: [
                      RegularText(
                        'You Pay',
                        fontSize: 14.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      Image.asset('assets/icons/ng.png', height: 25.h),
                      SizedBox(width: 6.h),
                      RegularText(
                        '₦13,900',
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 18.h),
                  child: Row(
                    children: [
                      RegularText(
                        'Amount Exchanged',
                        fontSize: 14.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      Image.asset('assets/icons/ng.png', height: 25.h),
                      SizedBox(width: 6.h),
                      RegularText(
                        '₦3,900',
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 18.h),
                  child: Row(
                    children: [
                      RegularText(
                        'Fees',
                        fontSize: 14.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      Image.asset('assets/icons/ng.png', height: 25.h),
                      SizedBox(width: 6.h),
                      RegularText(
                        '₦19.5',
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 18.h),
                  child: Row(
                    children: [
                      RegularText(
                        'Exchange Rate',
                        fontSize: 14.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      RegularText(
                        '₦1 = \$0.00130039',
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 18.h),
                  child: Row(
                    children: [
                      RegularText(
                        'You Get',
                        fontSize: 14.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      Image.asset('assets/icons/us.png', height: 25.h),
                      SizedBox(width: 6.h),
                      RegularText(
                        '\$5.04',
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
