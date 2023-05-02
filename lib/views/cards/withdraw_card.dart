import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class WithdrawCard extends StatefulWidget {
  const WithdrawCard({Key? key}) : super(key: key);

  @override
  State<WithdrawCard> createState() => _WithdrawCardState();
}

class _WithdrawCardState extends State<WithdrawCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.h),
        child: GeneralButton(
          'Withdraw',
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
                          r'$5.00',
                          fontSize: 22.sp,
                          color: Colors.black,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w800,
                        ),
                        SizedBox(height: 10.h),
                        RegularText(
                          'was Withdrawn from your USD Card\nbalance to your USD Wallet',
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
          'Withdraw',
          fontSize: 17.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          WorldStreetField(
            textInputType: TextInputType.number,
            maxLines: 1,
            fontSize: 20.sp,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 30.h, right: 12.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/icons/us.png', height: 30.h),
                      SizedBox(width: 4.h),
                      RegularText(
                        'USD',
                        fontSize: 20.sp,
                        color: Colors.black,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )
                ],
              ),
            ),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 4.h),
          RegularText(
            'You must have a minimum of \$1 in your USD Wallet',
            fontSize: 13.sp,
            color: Colors.black.withOpacity(.6),
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
