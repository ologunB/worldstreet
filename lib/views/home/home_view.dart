import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/home/request_money_view.dart';
import 'package:ft_worldstreet/views/settings/edit_account_view.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import '../transfers/enter_amount_view.dart';
import '../widgets/custom_text.dart';
import 'exchange_view.dart';
import 'fund_account_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(24.h),
            color: AppColors.skyBlue,
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        push(context, EditAccountScreen());
                      },
                      child: CircleAvatar(
                        radius: 20.h,
                        backgroundColor: Colors.white,
                        child: RegularText(
                          'E',
                          fontSize: 23.sp,
                          color: Color(0xff4114F5),
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Spacer(),
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
                      child: Container(
                        padding: EdgeInsets.all(12.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/icons/ng.png', height: 18.h),
                            SizedBox(width: 6.h),
                            RegularText(
                              'NG Naira',
                              fontSize: 14.sp,
                              color: Colors.black,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w700,
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded, size: 20.h)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                RegularText(
                  '₦75,033.45',
                  fontSize: 30.sp,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 20.h),
                Divider(
                  height: 0,
                  color: Colors.white,
                  thickness: 1.h,
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        push(context, FundAccountScreen());
                      },
                      child: d(Icons.add, 'Top up'),
                    ),
                    InkWell(
                      onTap: () {
                        push(context, ExchangeScreen());
                      },
                      child: d(Icons.add, 'Exchange'),
                    ),
                    InkWell(
                      onTap: doTransfer,
                      child: d(Icons.add, 'Transfer'),
                    ),
                  ],
                ),
                SizedBox(height: 60.h),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          Container(
            padding: EdgeInsets.all(24.h),
            margin: EdgeInsets.symmetric(horizontal: 24.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.h),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: doTransfer,
                  child: c(
                    'Transfer money',
                    'Transfer money to another user',
                    't0',
                  ),
                ),
                InkWell(
                  onTap: () {
                    push(context, RequestMoneyScreen());
                  },
                  child: c('Get paid from overseas',
                      'Get cash  with your username or via link', 't2'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget c(String a, String b, String c) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        children: [
          Image.asset('assets/icons/$c.png', height: 53.h),
          SizedBox(width: 10.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 12.h),
              RegularText(
                a,
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 4.h),
              RegularText(
                b,
                fontSize: 13.sp,
                color: Color(0xff6B6767),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget d(IconData i, String a) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 25.h,
          height: 25.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: a == 'Exchange'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/swap.png',
                        height: 18.h, width: 18.h)
                  ],
                )
              : Icon(i, size: 18.h, color: Colors.black),
        ),
        SizedBox(width: 6.h),
        RegularText(
          a,
          fontSize: 14.sp,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }

  void doTransfer() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.h),
        ),
        builder: (a) {
          return SelectTransfer();
        });
  }
}

class SelectAccount extends StatefulWidget {
  const SelectAccount({Key? key}) : super(key: key);

  @override
  State<SelectAccount> createState() => _SelectAccountState();
}

class _SelectAccountState extends State<SelectAccount> {
  @override
  Widget build(BuildContext context) {
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
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox(height: 27.h),
          RegularText(
            'Accounts',
            fontSize: 18.sp,
            color: Colors.black,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w800,
          ),
          SizedBox(height: 36.h),
          ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 11.h),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.h),
                          border:
                              Border.all(color: Colors.black.withOpacity(.5))),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/${a[i]}.png', height: 60.h),
                          SizedBox(width: 10.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 12.h),
                              RegularText(
                                b[i],
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                              SizedBox(height: 4.h),
                              RegularText(
                                c[i] + '34.00',
                                fontSize: 18.sp,
                                color: Colors.black.withOpacity(.5),
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }

  List<String> get a => ['ng', 'us', 'uk', 'eu', 'ch'];
  List<String> get b =>
      ['NG Naira', 'US Dollar', 'British Pounds', 'Euro', 'China Yaun'];
  List<String> get c => ['₦', '\$', '£', '€', '¥'];
}

class SelectTransfer extends StatefulWidget {
  const SelectTransfer({Key? key}) : super(key: key);

  @override
  State<SelectTransfer> createState() => _SelectTransferState();
}

class _SelectTransferState extends State<SelectTransfer> {
  @override
  Widget build(BuildContext context) {
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
      child: ListView.builder(
          itemCount: 2,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (_, i) {
            return Padding(
              padding: EdgeInsets.only(bottom: 11.h),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  push(context, EnterAmountScreen(type: i));
                },
                child: Container(
                  padding: EdgeInsets.all(8.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.h),
                      border: Border.all(color: Colors.black.withOpacity(.5))),
                  child: Row(
                    children: [
                      Image.asset('assets/icons/l$i.png', height: 60.h),
                      SizedBox(width: 10.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 12.h),
                          RegularText(
                            a[i],
                            fontSize: 18.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                          SizedBox(height: 4.h),
                          RegularText(
                            b[i],
                            fontSize: 18.sp,
                            color: Colors.black.withOpacity(.5),
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  List<String> get a => ['Transfer to Local banks', 'Transfer with Username'];
  List<String> get b => ['Local bank transfers', 'Transfer to another user'];
}
