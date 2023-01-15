import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/utils.dart';
import 'verify_email.dart';

class ConfirmPasscodeScreen extends StatefulWidget {
  const ConfirmPasscodeScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmPasscodeScreen> createState() => _ConfirmPasscodeScreenState();
}

class _ConfirmPasscodeScreenState extends State<ConfirmPasscodeScreen> {
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
              'Re-enter Passcode',
              fontSize: 24.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 17.h),
            RegularText(
              'Enter the passcode again',
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
            SizedBox(height: 56.h),
            GeneralButton(
              'Continue',
              buttonColor: AppColors.skyBlue,
              borderColor: AppColors.skyBlue,
              borderRadius: 8.h,
              fontSize: 14.sp,
              height: 50.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
              onTap: () {
                push(context, VerifyEmailScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
