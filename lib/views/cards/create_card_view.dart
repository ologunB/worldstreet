import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import 'complete_kyc_view.dart';

class CreateCardScreen extends StatefulWidget {
  const CreateCardScreen({Key? key}) : super(key: key);

  @override
  State<CreateCardScreen> createState() => _CreateCardScreenState();
}

class _CreateCardScreenState extends State<CreateCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.h),
        child: GeneralButton(
          'Create MasterCard',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 18.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w600,
          onPressed: () {
            push(context, CompleteKYCScreen());
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          Container(
            height: 190.h,
            padding: EdgeInsets.all(24.h),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: Stack(
              children: [
                Image.asset(
                  'assets/icons/icon.png',
                  height: 22.h,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'assets/icons/mc.png',
                    height: 28.h,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.h, vertical: 2.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                    child: RegularText(
                      'VIRTUAL CARD',
                      fontSize: 10.sp,
                      color: Colors.black,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RegularText(
                          'BALANCE',
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 4.h),
                        RegularText(
                          '\$0',
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(height: 40.h),
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
                RegularText(
                  'Card creation fee',
                  fontSize: 14.sp,
                  color: Color(0xff6B6767),
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4.h),
                RegularText(
                  'Free',
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 12.h),
                RegularText(
                  'Transaction fees',
                  fontSize: 14.sp,
                  color: Color(0xff6B6767),
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4.h),
                RegularText(
                  'Free',
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 12.h),
                RegularText(
                  '3D Secure',
                  fontSize: 14.sp,
                  color: Color(0xff6B6767),
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4.h),
                RegularText(
                  'No',
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
