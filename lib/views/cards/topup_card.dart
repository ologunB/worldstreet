import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/flutter_masked_text.dart';

class TopUpCard extends StatefulWidget {
  const TopUpCard({Key? key}) : super(key: key);

  @override
  State<TopUpCard> createState() => _TopUpCardState();
}

class _TopUpCardState extends State<TopUpCard> {
  MoneyMaskedTextController amount = MoneyMaskedTextController(
    decimalSeparator: ".",
    thousandSeparator: ",",
    initialValue: 0.00,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.all(24.h),
        child: GeneralButton(
          'Top Up',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 16.sp,
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
                          'was added to your USD Card\nbalance from your USD Wallet',
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
          'Top Up',
          fontSize: 18.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 17.h),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.h),
                border: Border.all(color: AppColors.dGrey)),
            child: Row(
              children: [
                Image.asset('assets/icons/us.png', height: 30.h),
                SizedBox(width: 8.h),
                RegularText(
                  'USD',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                SizedBox(width: 8.h),
                Expanded(
                  child: CupertinoTextField(
                    decoration: BoxDecoration(color: Colors.transparent),
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    controller: amount,
                    textInputAction: TextInputAction.done,
                    style: GoogleFonts.poppins(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24.h),
          RegularText(
            'You must have a minimum of \$5 in your USD Wallet',
            fontSize: 14.sp,
            color: AppColors.greyDark1,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
