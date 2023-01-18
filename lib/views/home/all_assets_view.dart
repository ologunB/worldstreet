import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/widgets/custom_text.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';
import 'package:intl/intl.dart';

import '../../core/models/binance_model.dart';
import 'asset_details_view.dart';

class AllAssetsView extends StatefulWidget {
  const AllAssetsView({Key? key, required this.allCoins}) : super(key: key);

  final List<BinanceModel> allCoins;
  @override
  State<AllAssetsView> createState() => _AllAssetsViewState();
}

class _AllAssetsViewState extends State<AllAssetsView> {
  final currencyFormatter = NumberFormat.currency(locale: 'en_US', symbol: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
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
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        children: [
          RegularText('Assets', fontSize: 24.sp, fontWeight: FontWeight.bold),
          SizedBox(height: 24.h),
          ListView.builder(
            itemCount: widget.allCoins.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (c, i) {
              BinanceModel one = widget.allCoins[i];
              return Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: InkWell(
                  onTap: () {
                    push(context, AssetDetailsView(model: one));
                  },
                  child: Container(
                    padding: EdgeInsets.all(18.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
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
                            errorWidget: (_, __, ___) =>
                                const SizedBox.shrink(),
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
                        SizedBox(width: 18.h),
                        Expanded(child: Image.asset('assets/icons/line.png')),
                        SizedBox(width: 18.h),
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
                                  color:
                                      one.priceChangePercentage24h!.isNegative
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
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
