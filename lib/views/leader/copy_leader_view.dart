import 'package:flutter/material.dart';

import '../../core/models/user_model.dart';
import '../../core/view_models/auth_vm.dart';
import '../widgets/amount_field.dart';
import '../widgets/base_view.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class CopyLeaderView extends StatefulWidget {
  const CopyLeaderView({Key? key, this.user, this.showUnsub = false})
      : super(key: key);

  final User? user;
  final bool showUnsub;
  @override
  State<CopyLeaderView> createState() => _CopyLeaderViewState();
}

class _CopyLeaderViewState extends State<CopyLeaderView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      // onModelReady: (m) => m.getOneTrader(widget.user?.id),
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
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 16.h),
          children: [
            RegularText(
              'Copy Trade',
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 24.h),
            LeaderItem(user: widget.user),
            SizedBox(height: 16.h),
            GeneralButton(
              'Stake Amount',
              buttonColor: AppColors.lightBlue,
              borderColor: AppColors.lightBlue,
              borderRadius: 8.h,
              fontSize: 14.sp,
              height: 40.h,
              textColor: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 12.h),
            StakeField(title: 'Stake Amount', amountChanged: (a) {}),
            StakeField(
              title: 'Taker Profit',
              amountChanged: (a) {},
              currencyChanged: (a) {},
            ),
            StakeField(
              title: 'Stop Loss',
              amountChanged: (a) {},
              currencyChanged: (a) {},
            ),
            SizedBox(height: 32.h),
            widget.showUnsub
                ? GeneralButton(
                    'Unsubscribe Trader',
                    buttonColor: AppColors.red,
                    borderColor: AppColors.red,
                    borderRadius: 8.h,
                    fontSize: 16.sp,
                    height: 50.h,
                    busy: coinModel.busy,
                    textColor: AppColors.white,
                    fontWeight: FontWeight.w600,
                    onPressed: () async {
                      bool a = await coinModel.removeTrader(widget.user?.id);
                      if (a) {
                        Navigator.pop(context, widget.user?.id);
                      }
                    },
                  )
                : GeneralButton(
                    'Copy Trader',
                    buttonColor: AppColors.skyBlue,
                    borderColor: AppColors.skyBlue,
                    borderRadius: 8.h,
                    fontSize: 16.sp,
                    height: 50.h,
                    busy: coinModel.busy,
                    textColor: AppColors.white,
                    fontWeight: FontWeight.w600,
                    onPressed: () {
                      coinModel.copyTrader(widget.user?.id);
                    },
                  )
          ],
        ),
      ),
    );
  }
}

class LeaderItem extends StatelessWidget {
  const LeaderItem({Key? key, required this.user}) : super(key: key);

  final User? user;

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
                      'assets/icons/p${1 % 3}.png',
                    ),
                  ),
                ),
                SizedBox(width: 8.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText(
                      user?.watched?.email ?? user?.email ?? '',
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
                          '0.01%',
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
                'Total Clients: 13 Stakers',
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
        ),
      ),
    );
  }
}
