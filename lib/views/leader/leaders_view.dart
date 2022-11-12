import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/leader/copy_leader_view.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import '../widgets/custom_text.dart';

class LeadersView extends StatefulWidget {
  const LeadersView({Key? key}) : super(key: key);

  @override
  State<LeadersView> createState() => _LeadersViewState();
}

class _LeadersViewState extends State<LeadersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: RegularText(
          'Leader Board',
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        children: [
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              leaderItem(2),
              const Spacer(),
              leaderItem(1),
              const Spacer(),
              leaderItem(3),
            ],
          ),
          SizedBox(height: 32.h),
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (c, i) {
                return InkWell(
                  onTap: () {
                    push(context, const CopyLeaderView());
                  },
                  splashColor: Colors.white,
                  highlightColor: Colors.white,
                  child: LeaderItem(i: i),
                );
              }),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  Widget leaderItem(int val) {
    return InkWell(
      onTap: () {
        push(context, const CopyLeaderView());
      },
      splashColor: Colors.white,
      highlightColor: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.h),
                  border: Border.all(width: 3.h, color: AppColors.skyBlue),
                ),
                child: CircleAvatar(
                  radius: val == 1 ? 57.h : 41.h,
                  backgroundColor: AppColors.white,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.h),
                    child: Image.asset(
                      'assets/icons/p${val % 3}.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: -12,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 24.h,
                        alignment: Alignment.center,
                        width: 24.h,
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue,
                          borderRadius: BorderRadius.circular(33.r),
                        ),
                        child: RegularText(
                          '$val',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          SizedBox(height: 20.h),
          RegularText(
            'Favour Eden',
            fontSize: 14.sp,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(height: 6.h),
        ],
      ),
    );
  }
}

class LeaderItem extends StatelessWidget {
  const LeaderItem({Key? key, required this.i}) : super(key: key);

  final int i;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
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
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.h,
                    backgroundColor: AppColors.grey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.h),
                      child: Image.asset(
                        'assets/icons/p${i % 3}.png',
                      ),
                    ),
                  ),
                  SizedBox(width: 8.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegularText(
                        'Daniel435',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star_rounded,
                            color: AppColors.skyBlue,
                            size: 16.h,
                          ),
                        ).toList(),
                      )
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
                        '\$ 35,457',
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
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                child: RegularText(
                  'Total Clients: 32 Stakers',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                child: RegularText(
                  'Total Profits: \$18,368.11',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h),
                child: RegularText(
                  'Total Loss: \$2,000.11',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ],
          )),
    );
  }
}
