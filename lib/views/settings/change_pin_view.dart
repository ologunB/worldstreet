import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class ChangePINScreen extends StatefulWidget {
  const ChangePINScreen({Key? key}) : super(key: key);

  @override
  State<ChangePINScreen> createState() => _ChangePINScreenState();
}

class _ChangePINScreenState extends State<ChangePINScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.h),
        child: GeneralButton(
          'Update',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 18.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RegularText(
          'Change PIN',
          fontSize: 18.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          SizedBox(height: 24.h),
          RegularText(
            'Old PIN',
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Pinput(
                obscureText: true,
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 48.h,
                  height: 64.h,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.skyBlue),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          RegularText(
            'New PIN',
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Pinput(
                obscureText: true,
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 48.h,
                  height: 64.h,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.skyBlue),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          RegularText(
            'Retype PIN',
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Pinput(
                obscureText: true,
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 48.h,
                  height: 64.h,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.skyBlue),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
