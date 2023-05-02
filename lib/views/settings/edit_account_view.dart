import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/utils.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
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
          'Account Information',
          fontSize: 24.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          SizedBox(height: 10.h),
          CircleAvatar(
            radius: 28.h,
            backgroundColor: Color(0xff291CC0),
            child: RegularText(
              'E',
              fontSize: 32.sp,
              textAlign: TextAlign.center,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 24.h),
          WorldStreetField(
            labelText: 'Username/Tag',
            textInputType: TextInputType.text,
            maxLines: 1,
            validator: Utils.isValidPassword,
            removeOutline: true,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16.h),
          WorldStreetField(
            labelText: 'Name',
            textInputType: TextInputType.text,
            maxLines: 1,
            removeOutline: true,
            validator: Utils.isValidPassword,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 4.h),
          RegularText(
            'To change your name, contact',
            fontSize: 14.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 4.h),
          RegularText(
            'support@useworldstreet.com',
            fontSize: 14.sp,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 12.h),
          WorldStreetField(
            labelText: 'Email',
            textInputType: TextInputType.text,
            maxLines: 1,
            removeOutline: true,
            validator: Utils.validateEmail,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16.h),
          WorldStreetField(
            labelText: 'Date of Birth',
            textInputType: TextInputType.text,
            maxLines: 1,
            removeOutline: true,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16.h),
          WorldStreetField(
            labelText: 'Phone Number',
            textInputType: TextInputType.text,
            maxLines: 1,
            removeOutline: true,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16.h),
          WorldStreetField(
            labelText: 'Country',
            textInputType: TextInputType.text,
            maxLines: 1,
            removeOutline: true,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
