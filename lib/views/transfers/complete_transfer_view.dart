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
          'Confirm',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 18.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w600,
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
                        Image.asset('assets/icons/flare.png', height: 56.h),
                        SizedBox(height: 14.h),
                        RegularText(
                          '10,000 NGN has been sent to\nBode Thomas Jolaoso',
                          fontSize: 18.sp,
                          color: Colors.black.withOpacity(.6),
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
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
                          fontWeight: FontWeight.w600,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
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
          fontSize: 24.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
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
          SizedBox(height: 18.h),
          RegularText(
            'Emmanuel Omale',
            fontSize: 14.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 6.h),
          RegularText(
            '@emmanuelO',
            fontSize: 14.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: AppColors.greyDark1,
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(24.h),
            decoration: BoxDecoration(
              color: Colors.white,
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
                        color: Colors.black.withOpacity(.6),
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      RegularText(
                        '10,000 NGN',
                        fontSize: 14.sp,
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
                        color: Colors.black.withOpacity(.6),
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      RegularText(
                        'None',
                        fontSize: 14.sp,
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
                      color: Colors.black.withOpacity(.6),
                      fontWeight: FontWeight.w600,
                    ),
                    Spacer(),
                    RegularText(
                      'Instant',
                      fontSize: 14.sp,
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
            labelText: 'Note (Optional)',
            textInputType: TextInputType.text,
            maxLines: 3,
            removeOutline: true,
            textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }
}
