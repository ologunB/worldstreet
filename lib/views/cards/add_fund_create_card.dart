import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/flutter_masked_text.dart';

class AddFundCreateCardScreen extends StatefulWidget {
  const AddFundCreateCardScreen({Key? key}) : super(key: key);

  @override
  State<AddFundCreateCardScreen> createState() =>
      _AddFundCreateCardScreenState();
}

class _AddFundCreateCardScreenState extends State<AddFundCreateCardScreen> {
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
          'Create Card',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 16.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w500,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RegularText(
          'Create Card',
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
            'You must have a minimum of \$5 in your USD account',
            fontSize: 14.sp,
            color: AppColors.greyDark1,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
