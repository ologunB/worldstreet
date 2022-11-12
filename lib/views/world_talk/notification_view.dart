import 'package:flutter/material.dart';
import '../home/all_traders_view.dart';
import '../widgets/custom_text.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  int currentIndex = 0;
  PageController pageController = PageController();

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
          title: RegularText(
            'Notifications',
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 6.h),
              child: InkWell(
                onTap: () {},
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
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.h, vertical: 20.h),
              padding: EdgeInsets.all(4.h),
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
                          color: currentIndex == 1
                              ? AppColors.white
                              : AppColors.skyBlue,
                        ),
                        child: RegularText(
                          'Latest',
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                          color: currentIndex == 0
                              ? AppColors.white
                              : AppColors.black,
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
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 30.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.h),
                          color: currentIndex == 0
                              ? AppColors.white
                              : AppColors.skyBlue,
                        ),
                        child: RegularText(
                          'Trending',
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                          color: currentIndex == 1
                              ? AppColors.white
                              : AppColors.black,
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
              children: [
                Column(
                  children: const [NotifBody(hasMsg: true)],
                ),
                Column(
                  children: const [TrendingBody(), NotifBody()],
                )
              ],
            ))
          ],
        ));
  }
}

class TrendingBody extends StatelessWidget {
  const TrendingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (_, __) => Divider(
              thickness: 1.h,
              color: AppColors.lightGrey,
              height: 0,
            ),
        itemCount: 3,
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (_, i) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: [
                Expanded(
                  child: RegularText(
                    '#BitcoinBullSeason',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.skyBlue,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(width: 16.h),
                Container(
                  height: 24.h,
                  alignment: Alignment.center,
                  width: 24.h,
                  decoration: BoxDecoration(
                    color: AppColors.skyBlue,
                    borderRadius: BorderRadius.circular(33.r),
                  ),
                  child: RegularText(
                    '2',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(width: 6.h),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16.h,
                  color: AppColors.black,
                )
              ],
            ),
          );
        });
  }
}

class NotifBody extends StatelessWidget {
  const NotifBody({Key? key, this.hasMsg}) : super(key: key);

  final bool? hasMsg;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (_, i) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset('assets/icons/p${i % 3}.png')),
                ),
                SizedBox(width: 16.h),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegularText(
                        names[i % 3],
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                        fontFamily: 'Poppins',
                      ),
                      SizedBox(height: 3.h),
                      RegularText(
                        'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                        fontFamily: 'Poppins',
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RegularText(
                      '35 min ago',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                      fontFamily: 'Poppins',
                    ),
                    SizedBox(height: 3.h),
                    if (hasMsg == true)
                      Container(
                        height: 24.h,
                        alignment: Alignment.center,
                        width: 24.h,
                        decoration: BoxDecoration(
                          color: AppColors.skyBlue,
                          borderRadius: BorderRadius.circular(33.r),
                        ),
                        child: RegularText(
                          '2',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
