import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/utils.dart';
import 'set_passcode.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? type;

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
              'Continue registration',
              fontSize: 24.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 17.h),
            RegularText(
              'Enter the necessary details',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
            SizedBox(height: 24.h),
            CustomDropDownButton(
              list: ['Maker', 'Taker'],
              value: type,
              hintText: 'User Type',
              onChanged: (a) {
                type = a;
                setState(() {});
              },
            ),
            SizedBox(height: 16.h),
            WorldStreetField(
              hintText: 'Email address',
              textInputType: TextInputType.emailAddress,
              maxLines: 1,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: 16.h),
            WorldStreetField(
              hintText: 'Password',
              textInputType: TextInputType.text,
              maxLines: 1,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 16.h),
            RegularText(
              '● Password should be 8 to 16 characters',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
            SizedBox(height: 8.h),
            RegularText(
              '● Use both uppercase and lowercase',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
            SizedBox(height: 8.h),
            RegularText(
              '● Symbols are not allowed',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
            SizedBox(height: 16.h),
            WorldStreetField(
              hintText: 'Confirm Password',
              textInputType: TextInputType.text,
              maxLines: 1,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 32.h),
            GeneralButton(
              'Signup',
              buttonColor: AppColors.skyBlue,
              borderColor: AppColors.skyBlue,
              borderRadius: 8.h,
              fontSize: 14.sp,
              height: 50.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
              onTap: () {
                pushReplacement(context, SetPasscodeScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
