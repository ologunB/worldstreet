import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class CompleteTransferScreen extends StatefulWidget {
  const CompleteTransferScreen({Key? key}) : super(key: key);

  @override
  State<CompleteTransferScreen> createState() => _CompleteTransferScreenState();
}

class _CompleteTransferScreenState extends State<CompleteTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      bottomSheet: Container(
        padding: EdgeInsets.all(24.h),
        color: AppColors.baground,
        child: GeneralButton(
          'Transfer',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 18.sp,
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
                          '10,000 NGN has been sent to\nBode Thomas Jolaoso',
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
          'Transfer Money',
          fontSize: 18.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          CircleAvatar(
            radius: 28.h,
            backgroundColor: Color(0xff291CC0),
            child: Image.asset('assets/icons/person.png'),
          ),
          SizedBox(height: 12.h),
          RegularText(
            'Emmanuel Omale',
            fontSize: 16.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 4.h),
          RegularText(
            '@emmanuelO',
            fontSize: 12.sp,
            textAlign: TextAlign.center,
            color: AppColors.grey,
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 35.h),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: Row(
                    children: [
                      RegularText(
                        'Recipient Gets',
                        fontSize: 14.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      RegularText(
                        '10,000 NGN',
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: Row(
                    children: [
                      RegularText(
                        'Fees',
                        fontSize: 14.sp,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      RegularText(
                        'None',
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    RegularText(
                      'Arriving',
                      fontSize: 14.sp,
                      color: AppColors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                    Spacer(),
                    RegularText(
                      'Instant',
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          WorldStreetField(
            hintText: 'Note (Optional)',
            textInputType: TextInputType.text,
            maxLines: 3,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
