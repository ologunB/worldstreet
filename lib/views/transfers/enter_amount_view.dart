import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import '../home/home_view.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import 'local_transfer_view.dart';
import 'username_transfer_view.dart';

class EnterAmountScreen extends StatefulWidget {
  const EnterAmountScreen({Key? key, required this.type}) : super(key: key);

  final int type;
  @override
  State<EnterAmountScreen> createState() => _EnterAmountScreenState();
}

class _EnterAmountScreenState extends State<EnterAmountScreen> {
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
          fontWeight: FontWeight.w600,
          onPressed: () {
            if (widget.type == 0) {
              push(context, LocalTransfersScreen());
            } else {
              push(context, UsernameTransferScreen());
            }
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
          field('You‘re Sending'),
          SizedBox(height: 6.h),
          RegularText(
            'Your NGN Balance is 760,000',
            fontSize: 12.sp,
            color: Colors.black.withOpacity(.5),
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 18.h),
          Row(
            children: [
              CircleAvatar(
                radius: 10.h,
                backgroundColor: Color(0xff6BF581),
                child: Icon(Icons.add_rounded, size: 16.h),
              ),
              SizedBox(width: 10.h),
              RegularText(
                'No fees',
                fontSize: 14.sp,
                color: Colors.black.withOpacity(.5),
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
          SizedBox(height: 18.h),
          Row(
            children: [
              CircleAvatar(
                radius: 10.h,
                backgroundColor: Color(0xff6BF581),
                child: Icon(Icons.add_rounded, size: 16.h),
              ),
              SizedBox(width: 10.h),
              RegularText(
                'Instant',
                fontSize: 14.sp,
                color: Colors.black.withOpacity(.5),
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget field(String type) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.circular(10.h),
        border: Border.all(
          color: Colors.black.withOpacity(.5),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.h),
                  ),
                  builder: (a) {
                    return SelectAccount();
                  });
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icons/us.png', height: 20.h),
                SizedBox(width: 3.h),
                RegularText(
                  'USD',
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                Icon(Icons.keyboard_arrow_down_rounded, size: 20.h),
              ],
            ),
          ),
          SizedBox(width: 20.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText(
                  type,
                  fontSize: 14.sp,
                  color: Colors.black.withOpacity(.5),
                  fontWeight: FontWeight.w700,
                ),
                CupertinoTextField(
                  decoration: BoxDecoration(color: Colors.transparent),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
