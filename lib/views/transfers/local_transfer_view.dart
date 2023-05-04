import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/utils.dart';
import 'beneficiary_view.dart';

class LocalTransfersScreen extends StatefulWidget {
  const LocalTransfersScreen({Key? key}) : super(key: key);

  @override
  State<LocalTransfersScreen> createState() => _LocalTransfersScreenState();
}

class _LocalTransfersScreenState extends State<LocalTransfersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      bottomSheet: Container(
        padding: EdgeInsets.all(24.h),
        color: AppColors.baground,
        child: GeneralButton(
          'Continue',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 18.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RegularText(
          'Account details',
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
          InkWell(
            onTap: () {
              push(context, BeneficiaryScreen());
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 11.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.h),
                border: Border.all(
                  color: Color(0xffCDCDCD),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegularText(
                    'Beneficiaries',
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  RegularText(
                    'Send to already saved channels',
                    fontSize: 12.sp,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          WorldStreetField(
            labelText: 'Bank',
            maxLines: 1,
            readOnly: true,
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.keyboard_arrow_down_rounded, size: 24.h)],
            ),
          ),
          SizedBox(height: 16.h),
          WorldStreetField(
            labelText: 'Account Number',
            textInputType: TextInputType.number,
            maxLines: 1,
            maxLength: 10,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16.h),
          WorldStreetField(
            labelText: 'Account Name',
            textInputType: TextInputType.text,
            maxLines: 1,
            readOnly: true,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
