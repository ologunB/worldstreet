import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
