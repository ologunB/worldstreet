import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import 'charts/chart_page.dart';

class AssetDetailsView extends StatefulWidget {
  const AssetDetailsView({Key? key}) : super(key: key);

  @override
  State<AssetDetailsView> createState() => _AssetDetailsViewState();
}

class _AssetDetailsViewState extends State<AssetDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 6.h),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 24.h,
              color: Colors.black,
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 12.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularText(
                'Statistics',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  RegularText(
                    'Current Price',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  const Spacer(),
                  RegularText(
                    '\$10,945.00',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Divider(
                  height: 0,
                  thickness: 1.h,
                  color: AppColors.lightGrey,
                ),
              ),
              Row(
                children: [
                  RegularText(
                    'Market Cap',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  const Spacer(),
                  RegularText(
                    '\$10,945.00',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Divider(
                  height: 0,
                  thickness: 1.h,
                  color: AppColors.lightGrey,
                ),
              ),
              Row(
                children: [
                  RegularText(
                    'Volume 24h',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  const Spacer(),
                  RegularText(
                    '\$10,945.00',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Divider(
                  height: 0,
                  thickness: 1.h,
                  color: AppColors.lightGrey,
                ),
              ),
              Row(
                children: [
                  RegularText(
                    'Trade Fee',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  const Spacer(),
                  RegularText(
                    '0.20% = 0.04 USD',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              GeneralButton(
                'Stake Amount',
                buttonColor: AppColors.skyBlue,
                borderColor: AppColors.skyBlue,
                borderRadius: 8.h,
                fontSize: 14.sp,
                height: 50.h,
                textColor: AppColors.white,
                fontWeight: FontWeight.w500,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 8.h),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/btc.png',
                  height: 40.h,
                  width: 40.h,
                ),
                SizedBox(width: 8.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText(
                      'BTC',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 4.h),
                    RegularText(
                      'Bitcoin',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.dGrey,
                    ),
                  ],
                ),
                SizedBox(width: 18.h),
                const Spacer(),
                SizedBox(width: 18.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RegularText(
                      '\$ 29,1124.12',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RegularText(
                          '0,01%',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.dGrey,
                        ),
                        const Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.green,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const Expanded(child: ChartPage()),
        ],
      ),
    );
  }
}
