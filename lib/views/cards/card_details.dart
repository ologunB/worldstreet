import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/cards/topup_card.dart';
import 'package:ft_worldstreet/views/cards/withdraw_card.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import '../widgets/c_card_widget.dart';
import '../widgets/custom_text.dart';

class CardDetailsScreen extends StatefulWidget {
  const CardDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          CustomCardWidget(),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  push(context, TopUpCard());
                },
                child: d('c0', 'Top up'),
              ),
              InkWell(
                onTap: () {
                  push(context, WithdrawCard());
                },
                child: d('c1', 'Withdraw'),
              ),
              InkWell(
                onTap: () {},
                child: d('c2', 'Lock'),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          Row(
            children: [
              RegularText(
                'Card Details',
                fontSize: 16.sp,
                color: AppColors.greyDark1,
                fontWeight: FontWeight.w500,
              ),
              Spacer(),
              RegularText(
                'Hide',
                fontSize: 16.sp,
                decoration: TextDecoration.underline,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(24.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.h),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 3,
                    spreadRadius: 3,
                  )
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                c('Name on Card', 'Adedeji Adeyemi Daniel'),
                Divider(height: 0, color: Color(0xffEDF0F4)),
                c('Card Number', '5412 7512 3412 3456'),
                Divider(height: 0, color: Color(0xffEDF0F4)),
                c('Expiry', '07/2026'),
                Divider(height: 0, color: Color(0xffEDF0F4)),
                c('CVV', '342'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget c(String a, String b) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            RegularText(
              a,
              fontSize: 14.sp,
              color: Color(0xffCDCDCD),
            ),
            SizedBox(height: 4.h),
            RegularText(
              b,
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 12.h),
          ],
        ),
        Spacer(),
        Image.asset(
          'assets/icons/copy.png',
          height: 18.h,
        )
      ],
    );
  }

  Widget d(String i, String a) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/icons/$i.png', height: 35.h),
        SizedBox(width: 6.h),
        RegularText(a, fontSize: 14.sp, color: Colors.black),
      ],
    );
  }
}
