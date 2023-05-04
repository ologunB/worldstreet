import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/home/request_money_view.dart';
import 'package:ft_worldstreet/views/settings/edit_account_view.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import '../transfers/enter_amount_view.dart';
import '../widgets/c_card_widget.dart';
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
        padding: EdgeInsets.zero,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(24.h),
                decoration: BoxDecoration(
                  color: AppColors.skyBlue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80.h),
                    bottomRight: Radius.circular(80.h),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            push(context, EditAccountScreen());
                          },
                          child: CircleAvatar(
                            radius: 23.h,
                            child: Image.asset('assets/icons/person.png'),
                          ),
                        ),
                        SizedBox(width: 12.h),
                        RegularText(
                          'Hi, Emmanuel!',
                          fontSize: 14.sp,
                          color: Colors.white,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.h, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Image.asset('assets/icons/ng.png',
                                    height: 12.h),
                                SizedBox(width: 6.h),
                                RegularText(
                                  'NG Naira',
                                  fontSize: 10.sp,
                                  color: Colors.black,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w600,
                                ),
                                Icon(Icons.keyboard_arrow_down_rounded,
                                    size: 20.h)
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
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            push(context, FundAccountScreen());
                          },
                          child: d('c0', 'Top up'),
                        ),
                        InkWell(
                          onTap: () {
                            push(context, ExchangeScreen());
                          },
                          child: d('e1', 'Exchange'),
                        ),
                      ],
                    ),
                    SizedBox(height: 60.h),
                  ],
                ),
              ),
              Positioned(
                bottom: -100.h,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(24.0),
                  child: CustomCardWidget(),
                ),
              ),
            ],
          ),
          SizedBox(height: 100.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: RegularText(
              'Actions for you to take',
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h),
            child: Divider(
              height: 0,
              color: AppColors.grey,
              thickness: 1.h,
            ),
          ),
          SizedBox(height: 34.h),
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              physics: ClampingScrollPhysics(),
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: InkWell(
                    onTap: () {
                      if (i == 0) {
                        doTransfer();
                      } else if (i == 1) {
                        // go to main index 1
                      } else if (i == 2) {
                        push(context, RequestMoneyScreen());
                      }
                    },
                    child: c(i),
                  ),
                );
              }),
        ],
      ),
    );
  }

  Widget c(int i) {
    return Row(
      children: [
        Image.asset('assets/icons/o$i.png', height: 53.h),
        SizedBox(width: 16.h),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegularText(
                [
                  'Transfer money',
                  'Create a virtual card',
                  'Get paid from anywhere',
                ][i],
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 4.h),
              RegularText(
                [
                  'Transfer money to another user',
                  'Pay school fees and shop across stores',
                  'Get paid with just your username or via link',
                ][i],
                fontSize: 12.sp,
                color: Color(0xff6B6767),
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget d(String i, String a) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/icons/$i.png', height: 35.h),
        SizedBox(width: 6.h),
        RegularText(
          a,
          fontSize: 14.sp,
          color: Colors.white,
          fontWeight: FontWeight.w400,
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
          SizedBox(height: 24.h),
          RegularText(
            'Accounts',
            fontSize: 16.sp,
            color: Colors.black,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 24.h),
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
                          border: Border.all(
                              color: i == 0
                                  ? AppColors.skyBlue
                                  : Color(0xffCDCDCD))),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/${a[i]}.png', height: 34.h),
                          SizedBox(width: 12.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RegularText(
                                b[i],
                                fontSize: 12.sp,
                                color: AppColors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: 4.h),
                              RegularText(
                                c[i] + '34.00',
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.radio_button_checked,
                            color:
                                i == 0 ? AppColors.skyBlue : Color(0xffCDCDCD),
                          ),
                          SizedBox(width: 12.h),
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
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            RegularText(
              'How do you want to transfer?',
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ListView.builder(
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
                              border: Border.all(color: Color(0xffCDCDCD))),
                          child: Row(
                            children: [
                              Image.asset('assets/icons/l$i.png', height: 34.h),
                              SizedBox(width: 12.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RegularText(
                                    b[i],
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(height: 4.h),
                                  RegularText(
                                    a[i],
                                    fontSize: 12.sp,
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(
                                Icons.radio_button_checked,
                                color: Color(0xffCDCDCD),
                              ),
                              SizedBox(width: 12.h),
                            ],
                          ),
                        )),
                  );
                }),
          ],
        ));
  }

  List<String> get a => ['Transfer to Local banks', 'Transfer with Username'];
  List<String> get b => ['Local bank transfers', 'Transfer to another user'];
}
