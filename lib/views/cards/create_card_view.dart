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
          fontSize: 16.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w500,
          onPressed: () {
            push(context, CompleteKYCScreen());
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          Container(
            height: 130.h,
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 14.h),
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
            child: Stack(
              children: [
                Image.asset(
                  'assets/icons/icon.png',
                  height: 22.h,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset('assets/icons/mc.png', height: 19.h),
                ),
                Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RegularText(
                          '**** **** **** 1234',
                          fontSize: 18.sp,
                          color: Colors.black,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 2.h),
                        RegularText(
                          'Adedeji Daniel',
                          fontSize: 12.sp,
                          color: Colors.black,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: RegularText(
                      '\$986.30',
                      fontSize: 10.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/icons/cc0.png', height: 45.h),
                    SizedBox(width: 12.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText(
                          'Free',
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        RegularText(
                          'Card creation fee',
                          fontSize: 12.sp,
                          color: Color(0xff6B6767),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Image.asset('assets/icons/cc1.png', height: 45.h),
                    SizedBox(width: 12.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText(
                          'Free',
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        RegularText(
                          'Transaction fees',
                          fontSize: 12.sp,
                          color: Color(0xff6B6767),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Image.asset('assets/icons/cc2.png', height: 45.h),
                    SizedBox(width: 12.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText(
                          'No',
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        RegularText(
                          '3D Secure',
                          fontSize: 12.sp,
                          color: Color(0xff6B6767),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
