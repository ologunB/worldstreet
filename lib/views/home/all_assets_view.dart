import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/widgets/custom_text.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import 'asset_details_view.dart';

class AllAssetsView extends StatefulWidget {
  const AllAssetsView({Key? key}) : super(key: key);

  @override
  State<AllAssetsView> createState() => _AllAssetsViewState();
}

class _AllAssetsViewState extends State<AllAssetsView> {
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
              itemCount: 12,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (c, i) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 24.h),
                  child: InkWell(
                    onTap: () {
                      push(context, const AssetDetailsView());
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
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/b${i % 3}.png',
                            height: 40.h,
                            width: 40.h,
                          ),
                          SizedBox(width: 8.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RegularText(
                                ['BTC', 'LTC', 'ETH'][i % 3],
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(height: 4.h),
                              RegularText(
                                '+1.6%',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.dGrey,
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
                  ),
                );
              })
        ],
      ),
    );
  }
}
