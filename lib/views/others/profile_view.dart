import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

int profileIndex = 0;

class _ProfileViewState extends State<ProfileView> {
  PageController pageController = PageController(initialPage: profileIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        IntrinsicHeight(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                'assets/icons/cover.png',
                height: 220.h,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 50.h, right: 24.h),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/settings.png'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 12.h, right: 18.h),
                  child: RegularText(
                    '@daysman',
                    fontSize: 15.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 12.h, left: 18.h),
                  child: RegularText(
                    'Trader',
                    fontSize: 15.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                  bottom: -25.h,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.white, width: 4.h),
                          borderRadius: BorderRadius.circular(112.h),
                        ),
                        child: CircleAvatar(
                          radius: 49.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(112.h),
                            child: Image.asset(
                              'assets/icons/image.png',
                              height: 100.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        SizedBox(height: 40.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.h),
          padding: EdgeInsets.all(4.h),
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(6.h),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    pageController.jumpToPage(0);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.h),
                      color: profileIndex == 0
                          ? AppColors.white
                          : AppColors.lightBlue,
                    ),
                    child: RegularText(
                      'Overview',
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    pageController.jumpToPage(1);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.h),
                      color: profileIndex == 1
                          ? AppColors.white
                          : AppColors.lightBlue,
                    ),
                    child: RegularText(
                      'Social',
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    pageController.jumpToPage(2);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.h),
                      color: profileIndex == 2
                          ? AppColors.white
                          : AppColors.lightBlue,
                    ),
                    child: RegularText(
                      'Transactions',
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (a) {
              setState(() {
                profileIndex = a;
              });
            },
            children: const [
              OverviewBody(),
              SocialsBody(),
              TransactionsBody(),
            ],
          ),
        )
      ],
    ));
  }
}

class OverviewBody extends StatelessWidget {
  const OverviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 18.h),
      children: [
        SizedBox(height: 16.h),
        item('Return', 'Last 3 months', c: '100%'),
        item('Stakers worked with', 'Last 3 months', c: '1,120'),
        Padding(
          padding: EdgeInsets.only(bottom: 10.h, top: 16.h),
          child: RegularText(
            'Other Details',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: item('5%', 'Crypto Commission',
                  color: Colors.black.withOpacity(.1)),
            ),
            SizedBox(width: 12.h),
            Expanded(
              child: item('4,700.11', 'Crypto Equity, USDT',
                  color: Colors.black.withOpacity(.1)),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: item('5%', 'Forex Commission',
                  color: Colors.black.withOpacity(.1)),
            ),
            SizedBox(width: 12.h),
            Expanded(
              child: item('3,700.11', 'Forex Equity, USDT',
                  color: Colors.black.withOpacity(.1)),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.h, top: 16.h),
          child: GeneralButton(
            'Start Copying',
            buttonColor: AppColors.skyBlue,
            borderColor: AppColors.skyBlue,
            borderRadius: 8.h,
            fontSize: 14.sp,
            height: 50.h,
            textColor: AppColors.white,
            fontWeight: FontWeight.w600,
            onPressed: () {},
          ),
        ),
        SizedBox(height: 108.h),
      ],
    );
  }

  Widget item(String a, String b, {String? c, Color? color}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Container(
        padding: EdgeInsets.all(14.h),
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.lightGrey, width: 1.h),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText(
                  a,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
                SizedBox(height: 4.h),
                RegularText(
                  b,
                  fontFamily: 'Poppins',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff939497),
                ),
              ],
            ),
            const Spacer(),
            if (c != null)
              RegularText(
                c,
                fontSize: 24.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
          ],
        ),
      ),
    );
  }
}

class SocialsBody extends StatelessWidget {
  const SocialsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      children: [
        SizedBox(height: 8.h),
        RegularText(
          'Daysman Oyakhilome',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          fontFamily: 'Poppins',
          textAlign: TextAlign.center,
        ),
        RegularText(
          'Veteran Member',
          fontSize: 14.sp,
          fontFamily: 'Poppins',
          color: AppColors.dGrey,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24.h),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RegularText(
                    '15.9K',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    textAlign: TextAlign.center,
                    color: AppColors.skyBlue,
                  ),
                  RegularText(
                    'Followers',
                    fontSize: 12.sp,
                    fontFamily: 'Poppins',
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              VerticalDivider(
                thickness: 1.h,
                width: 0,
                color: AppColors.lightGrey,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RegularText(
                    '80',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    textAlign: TextAlign.center,
                    color: AppColors.skyBlue,
                  ),
                  RegularText(
                    'Following',
                    fontSize: 12.sp,
                    fontFamily: 'Poppins',
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 37.h),
        RegularText(
          'Lorem ipsum dolor sit amet, consectetur adipiscing\nelit. Quis urna, lorem ullamcorper sed tellus\nerat nunc ut. ✨🔥',
          fontSize: 12.sp,
          fontFamily: 'Poppins',
          color: AppColors.black,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/tw.png',
                  height: 20.h,
                  width: 20.h,
                ),
                RegularText(
                  'Add Twitter',
                  fontSize: 12.sp,
                  fontFamily: 'Poppins',
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/fb.png',
                  height: 20.h,
                  width: 20.h,
                ),
                RegularText(
                  'Add Facebook',
                  fontSize: 12.sp,
                  fontFamily: 'Poppins',
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/ig.png',
                  height: 20.h,
                  width: 20.h,
                ),
                RegularText(
                  'Add Instagram',
                  fontSize: 12.sp,
                  fontFamily: 'Poppins',
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 27.h),
        GeneralButton(
          'Follow',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 14.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w600,
          onPressed: () {},
        ),
        SizedBox(height: 100.h),
      ],
    );
  }
}

class TransactionsBody extends StatefulWidget {
  const TransactionsBody({Key? key}) : super(key: key);

  @override
  State<TransactionsBody> createState() => _TransactionsBodyState();
}

class _TransactionsBodyState extends State<TransactionsBody> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40.h, vertical: 10.h),
          padding: EdgeInsets.all(4.h),
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(6.h),
          ),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    pageController.jumpToPage(0);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.h),
                      color: currentIndex == 0
                          ? AppColors.white
                          : AppColors.lightBlue,
                    ),
                    child: RegularText(
                      'Open Orders(7)',
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    pageController.jumpToPage(1);
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.h),
                      color: currentIndex == 1
                          ? AppColors.white
                          : AppColors.lightBlue,
                    ),
                    child: RegularText(
                      'History(3)',
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (a) {
              setState(() {
                currentIndex = a;
              });
            },
            children: const [
              OrdersBody(),
              OrdersBody(),
            ],
          ),
        ),
      ],
    );
  }
}

class OrdersBody extends StatelessWidget {
  const OrdersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            ListView.separated(
                separatorBuilder: (_, __) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Divider(
                        height: 0,
                        thickness: 1.h,
                        color: AppColors.lightGrey,
                      ),
                    ),
                itemCount: 12,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 10.h),
                physics: const ClampingScrollPhysics(),
                itemBuilder: (c, i) {
                  return Row(
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
                            'Sell, 0,18 lot',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                          SizedBox(height: 4.h),
                          RegularText(
                            'EUROUSDm - 3 orders',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.dGrey,
                            fontFamily: 'Poppins',
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RegularText(
                            '-183.65 USD',
                            fontSize: 18.sp,
                            fontFamily: 'Poppins',
                            color: i.isEven ? Colors.red : Colors.green,
                          ),
                          SizedBox(height: 4.h),
                          RegularText(
                            '0.99547',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.dGrey,
                            fontFamily: 'Poppins',
                          ),
                        ],
                      )
                    ],
                  );
                }),
            SizedBox(height: 180.h),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(right: 18.h, left: 18.h, bottom: 104.h),
            child: GeneralButton(
              'Start copying',
              buttonColor: AppColors.skyBlue,
              borderColor: AppColors.skyBlue,
              borderRadius: 8.h,
              fontSize: 14.sp,
              height: 50.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
