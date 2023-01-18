import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/models/binance_model.dart';
import '../../core/view_models/auth_vm.dart';
import '../widgets/base_view.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import 'charts/chart_page.dart';

class AssetDetailsView extends StatefulWidget {
  const AssetDetailsView({Key? key, required this.model}) : super(key: key);

  final BinanceModel model;
  @override
  State<AssetDetailsView> createState() => _AssetDetailsViewState();
}

class _AssetDetailsViewState extends State<AssetDetailsView> {
  final currencyFormatter = NumberFormat.currency(locale: 'en_US', symbol: "");

  @override
  Widget build(BuildContext context) {
    BinanceModel one = widget.model;
    return BaseView<AuthViewModel>(
      builder: (_, AuthViewModel coinModel, __) => Scaffold(
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
                      '\$${currencyFormatter.format(one.currentPrice!)}',
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
                      '\$${currencyFormatter.format(one.marketCap!)}',
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
                      '\$${currencyFormatter.format(one.totalVolume)}',
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
                  onPressed: () {},
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(38.h),
                    child: CachedNetworkImage(
                      imageUrl: one.image!,
                      height: 40.h,
                      width: 40.h,
                      fit: BoxFit.fill,
                      placeholder: (_, __) => const SizedBox.shrink(),
                      errorWidget: (_, __, ___) => const SizedBox.shrink(),
                    ),
                  ),
                  SizedBox(width: 8.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegularText(
                        one.name!,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 4.h),
                      RegularText(
                        one.symbol!.toUpperCase(),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyDark1,
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RegularText(
                        '\$${currencyFormatter.format(one.currentPrice!)}',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RegularText(
                            '${currencyFormatter.format(one.priceChangePercentage24h!)}%',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyDark1,
                          ),
                          Icon(
                            one.priceChangePercentage24h!.isNegative
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: one.priceChangePercentage24h!.isNegative
                                ? Colors.red
                                : Colors.green,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(child: ChartPage(coin: one.symbol!.toUpperCase())),
          ],
        ),
      ),
    );
  }
}
