import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/models/user_model.dart';
import '../../core/view_models/auth_vm.dart';
import '../leader/copy_leader_view.dart';
import '../widgets/base_view.dart';
import '../widgets/custom_text.dart';
import '../widgets/utils.dart';
import '../world_talk/notification_view.dart';
import 'all_assets_view.dart';
import 'all_traders_view.dart';
import 'asset_details_view.dart';
import 'main_layout.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final currencyFormatter = NumberFormat.currency(locale: 'en_US', symbol: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu_rounded,
            size: 24.h,
            color: AppColors.skyBlue,
          ),
          onPressed: () => mainLayoutScaffoldKey.currentState!.openDrawer(),
        ),
        title: RegularText(
          'Welcome to WorldStreet',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
        actions: [
          InkWell(
            onTap: () {
              push(context, const NotificationsView());
            },
            child: Padding(
              padding: EdgeInsets.only(right: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/noti.png',
                    height: 40.h,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        children: [
          SizedBox(height: 10.h),
          BaseView<AuthViewModel>(
            onModelReady: (m) => m.getBalances(),
            builder: (_, AuthViewModel coinModel, __) => coinModel.busy
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator(strokeWidth: 2)],
                  )
                : coinModel.balances == null
                    ? Center(
                        child: RegularText(
                          coinModel.error!,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.red,
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                RegularText(
                                  'Total Balance',
                                  fontSize: 14.sp,
                                  color: AppColors.white,
                                ),
                                Spacer(),
                                RegularText(
                                  'Crypto Market',
                                  fontSize: 14.sp,
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: 30.h),
                            Row(
                              children: [
                                RegularText(
                                  '\$${currencyFormatter.format(coinModel.totalBalance)}',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32.sp,
                                  color: AppColors.white,
                                ),
                                Spacer(),
                                /*   Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 15.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.36),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: RegularText(
                                    '+15%',
                                    fontSize: 14.sp,
                                    color: AppColors.white,
                                  ),
                                ),*/
                              ],
                            ),
                            SizedBox(height: 30.h),
                            Row(
                              children: [
                                RegularText(
                                  '\$0.00 Today’s Profit',
                                  fontSize: 14.sp,
                                  color: AppColors.white,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.more_horiz,
                                  size: 30,
                                  color: AppColors.white,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
          ),
          SizedBox(height: 30.h),
          BaseView<AuthViewModel>(
            onModelReady: (m) => m.getCoins(),
            builder: (_, AuthViewModel coinModel, __) => coinModel.busy
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator(strokeWidth: 2)],
                  )
                : coinModel.allCoins == null
                    ? RegularText(
                        'An error has occurred',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.red,
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              RegularText(
                                'Assets',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  push(
                                      context,
                                      AllAssetsView(
                                          allCoins: coinModel.allCoins!));
                                },
                                child: RegularText(
                                  'view all',
                                  fontSize: 14.sp,
                                  color: AppColors.skyBlue,
                                ),
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [0, 1, 2, 3, 4]
                                  .map(
                                    (i) => InkWell(
                                      onTap: () {
                                        push(
                                            context,
                                            AssetDetailsView(
                                                model: coinModel.allCoins![i]));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .6,
                                        margin: EdgeInsets.only(
                                            right: 20.h,
                                            top: 16.h,
                                            left: 10.h,
                                            bottom: 24.h),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 18.h, vertical: 18.h),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 4,
                                              blurRadius: 10,
                                              offset: const Offset(0,
                                                  1), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RegularText(
                                                      coinModel
                                                          .allCoins![i].name!,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.black,
                                                    ),
                                                    RegularText(
                                                      coinModel
                                                          .allCoins![i].symbol!
                                                          .toUpperCase(),
                                                      fontSize: 12.sp,
                                                      color:
                                                          AppColors.greyDark1,
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          38.h),
                                                  child: CachedNetworkImage(
                                                    imageUrl: coinModel
                                                        .allCoins![i].image!,
                                                    height: 36.h,
                                                    width: 36.h,
                                                    fit: BoxFit.fill,
                                                    placeholder: (_, __) =>
                                                        const SizedBox.shrink(),
                                                    errorWidget: (_, __, ___) =>
                                                        const SizedBox.shrink(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 34.h),
                                            Row(
                                              children: [
                                                RegularText(
                                                  '\$${currencyFormatter.format(coinModel.allCoins![i].currentPrice!)}',
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black,
                                                ),
                                                Spacer(),
                                                RegularText(
                                                  '${currencyFormatter.format(coinModel.allCoins![i].priceChangePercentage24h!)}%',
                                                  fontSize: 12.sp,
                                                  color: AppColors.skyBlue,
                                                ),
                                                Icon(
                                                  coinModel
                                                          .allCoins![i]
                                                          .priceChangePercentage24h!
                                                          .isNegative
                                                      ? Icons.arrow_drop_down
                                                      : Icons.arrow_drop_up,
                                                  color: coinModel
                                                          .allCoins![i]
                                                          .priceChangePercentage24h!
                                                          .isNegative
                                                      ? Colors.red
                                                      : Colors.green,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
          ),
          SizedBox(height: 10.h),
          BaseView<AuthViewModel>(
            onModelReady: (m) => m.getAccounts(),
            builder: (_, AuthViewModel usersModel, __) => usersModel.busy
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [CircularProgressIndicator(strokeWidth: 2)],
                  )
                : usersModel.accounts == null
                    ? RegularText(
                        'An error has occurred',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.red,
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              RegularText('Top traders',
                                  fontSize: 20.sp, fontWeight: FontWeight.w600),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  push(
                                      context,
                                      AllTradersView(
                                          accounts: usersModel.accounts!));
                                },
                                child: RegularText(
                                  'view all',
                                  fontSize: 14.sp,
                                  color: AppColors.skyBlue,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          usersModel.accounts!.isEmpty
                              ? RegularText(
                                  'No ${usersModel.userType} is present currently',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.skyBlue,
                                )
                              : ListView.builder(
                                  itemCount: usersModel.accounts!.length > 3
                                      ? 3
                                      : usersModel.accounts!.length,
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemBuilder: (c, i) {
                                    User u = usersModel.accounts![i];
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 16.h),
                                      child: InkWell(
                                        onTap: () {
                                          push(
                                              context, CopyLeaderView(user: u));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(18.h),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 4,
                                                blurRadius: 10,
                                                offset: const Offset(0,
                                                    1), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/icons/p${i % 3}.png',
                                                height: 40.h,
                                                width: 40.h,
                                              ),
                                              SizedBox(width: 8.h),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RegularText(
                                                    u.email!,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  RegularText(
                                                    '1st',
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.dGrey,
                                                  ),
                                                ],
                                              ),
                                              /*  SizedBox(width: 18.h),
                                              Expanded(
                                                  child: Image.asset(
                                                      'assets/icons/line.png')),
                                              SizedBox(width: 18.h),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  RegularText(
                                                    '\$ 3,457',
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      RegularText(
                                                        '0,01%',
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors.dGrey,
                                                      ),
                                                      const Icon(
                                                        Icons
                                                            .arrow_drop_down_sharp,
                                                        color: Colors.green,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              )*/
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                        ],
                      ),
          ),
          /*   Row(
            children: [
              RegularText(
                'Traders profile',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  push(context, AllTradersView());
                },
                child: RegularText(
                  'view all',
                  fontSize: 14.sp,
                  color: AppColors.skyBlue,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [1, 2, 3]
                  .map(
                    (e) => Container(
                      width: MediaQuery.of(context).size.width * .6,
                      margin: EdgeInsets.only(
                          right: 20.h, top: 16.h, bottom: 24.h, left: 10.h),
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.h, vertical: 18.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RegularText(
                                    'Daniel435',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                  RegularText(
                                    'ETH',
                                    fontSize: 12.sp,
                                    color: AppColors.lightGrey,
                                  ),
                                ],
                              ),
                              Spacer(),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.h),
                                child: Image.asset(
                                  'assets/icons/p1.png',
                                  height: 36.h,
                                  width: 36.h,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 34.h),
                          Row(
                            children: [
                              RegularText(
                                '1,132,151',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                              Spacer(),
                              RegularText(
                                '2,35%',
                                fontSize: 12.sp,
                                color: AppColors.skyBlue,
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: AppColors.skyBlue,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SizedBox(height: 100.h),*/
        ],
      ),
    );
  }
}
