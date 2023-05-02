import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/cards/topup_card.dart';
import 'package:ft_worldstreet/views/cards/withdraw_card.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

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
                  alignment: Alignment.center,
                  child: RegularText(
                    '5412   7512   3412   3456',
                    fontSize: 18.sp,
                    color: Colors.white,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w700,
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
                          '\$986.30',
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  push(context, TopUpCard());
                },
                child: d(Icons.add, 'Top up'),
              ),
              InkWell(
                onTap: () {
                  push(context, WithdrawCard());
                },
                child: d(Icons.remove, 'Withdraw'),
              ),
              InkWell(
                onTap: () {},
                child: d(Icons.lock, 'Lock'),
              ),
            ],
          ),
          SizedBox(height: 20.h),
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
                Row(
                  children: [
                    RegularText(
                      'Card Details',
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    Spacer(),
                    RegularText(
                      'Hide',
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
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
              color: Color(0xff6B6767),
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 4.h),
            RegularText(
              b,
              fontSize: 14.sp,
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

  Widget d(IconData i, String a) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(4.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Icon(
            i,
            size: 20.h,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 6.h),
        RegularText(
          a,
          fontSize: 14.sp,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
