import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class AddFundCreateCardScreen extends StatefulWidget {
  const AddFundCreateCardScreen({Key? key}) : super(key: key);

  @override
  State<AddFundCreateCardScreen> createState() =>
      _AddFundCreateCardScreenState();
}

class _AddFundCreateCardScreenState extends State<AddFundCreateCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.h),
        child: GeneralButton(
          'Create Card',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 18.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w600,
          onPressed: () {},
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RegularText(
          'Create Card',
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
            'You must have a minimum of \$5 in your USD Wallet',
            fontSize: 13.sp,
            color: Colors.black.withOpacity(.6),
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
