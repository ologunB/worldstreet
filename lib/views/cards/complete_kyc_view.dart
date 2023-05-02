import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/utils.dart';
import 'add_fund_create_card.dart';

class CompleteKYCScreen extends StatefulWidget {
  const CompleteKYCScreen({Key? key}) : super(key: key);

  @override
  State<CompleteKYCScreen> createState() => _CompleteKYCScreenState();
}

class _CompleteKYCScreenState extends State<CompleteKYCScreen> {
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
          fontSize: 18.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w600,
          onPressed: () {
            push(context, AddFundCreateCardScreen());
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RegularText(
          'Complete your KYC to create Card',
          fontSize: 17.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          SizedBox(height: 24.h),
          WorldStreetField(
            hintText: 'BVN',
            textInputType: TextInputType.text,
            maxLines: 1,
            removeOutline: true,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16.h),
          WorldStreetField(
            hintText: 'Title',
            textInputType: TextInputType.text,
            maxLines: 1,
            readOnly: true,
            removeOutline: true,
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.keyboard_arrow_down_rounded, size: 24.h)],
            ),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16.h),
          WorldStreetField(
            hintText: 'Gender',
            textInputType: TextInputType.text,
            maxLines: 1,
            readOnly: true,
            removeOutline: true,
            textInputAction: TextInputAction.next,
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.keyboard_arrow_down_rounded, size: 24.h)],
            ),
          ),
          SizedBox(height: 16.h),
          WorldStreetField(
            hintText: 'Date of Birth',
            textInputType: TextInputType.text,
            maxLines: 1,
            removeOutline: true,
            readOnly: true,
            textInputAction: TextInputAction.next,
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/dob.png',
                  height: 25.h,
                )
              ],
            ),
          ),
          SizedBox(height: 16.h),
          WorldStreetField(
            hintText: 'Phone Number',
            textInputType: TextInputType.text,
            maxLines: 1,
            removeOutline: true,
            textInputAction: TextInputAction.next,
            prefixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/phone.png',
                  height: 25.h,
                )
              ],
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
