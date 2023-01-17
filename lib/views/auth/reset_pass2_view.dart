import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/utils.dart';
import 'login_view.dart';

class ConfirmPassScreen extends StatefulWidget {
  const ConfirmPassScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmPassScreen> createState() => _ConfirmPassScreenState();
}

class _ConfirmPassScreenState extends State<ConfirmPassScreen> {
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
              'Forgot Password',
              fontSize: 24.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 17.h),
            RegularText(
              'Enter a new password different from the one you\nused previously',
              fontSize: 14.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
            SizedBox(height: 32.h),
            WorldStreetField(
              hintText: 'Enter OTP sent',
              textInputType: TextInputType.emailAddress,
              maxLines: 1,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 16.h),
            WorldStreetField(
              hintText: 'Enter new password',
              textInputType: TextInputType.text,
              maxLines: 1,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 16.h),
            WorldStreetField(
              hintText: 'Confirm new password',
              textInputType: TextInputType.text,
              maxLines: 1,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 16.h),
            SizedBox(height: 32.h),
            GeneralButton(
              'Reset Password',
              buttonColor: AppColors.skyBlue,
              borderColor: AppColors.skyBlue,
              borderRadius: 8.h,
              fontSize: 14.sp,
              height: 50.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
              onPressed: () {
                pushReplacement(context, LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
