import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/utils.dart';
import 'verify_identity_view.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.black),
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24.h),
          children: [
            RegularText(
              'Verify Email Address',
              fontSize: 24.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 17.h),
            RegularText(
              'Enter the 6-digit verification code sent to your\nemail feyinti112@gmail.com.',
              fontSize: 14.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Pinput(
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
                  onCompleted: (pin) => print(pin),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.email_outlined,
                  color: AppColors.grey,
                  size: 20.h,
                ),
                SizedBox(width: 8.h),
                RegularText(
                  'Resend code',
                  fontSize: 14.sp,
                  fontFamily: 'Gilroy',
                  color: AppColors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: 48.h),
            GeneralButton(
              'Verify',
              buttonColor: AppColors.skyBlue,
              borderColor: AppColors.skyBlue,
              borderRadius: 8.h,
              fontSize: 14.sp,
              height: 50.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
              onTap: () {
                push(context, VerifyIdentityScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
