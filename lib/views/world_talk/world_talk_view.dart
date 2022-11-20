import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkfy_text/linkfy_text.dart';
import '../home/all_traders_view.dart';
import '../home/main_layout.dart';
import '../widgets/custom_text.dart';
import 'create_feed.dart';
import 'explore_view.dart';
import 'notification_view.dart';

class WorldTalkView extends StatefulWidget {
  const WorldTalkView({Key? key}) : super(key: key);

  @override
  State<WorldTalkView> createState() => _WorldTalkViewState();
}

class _WorldTalkViewState extends State<WorldTalkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.menu_rounded,
            size: 24.h,
            color: AppColors.skyBlue,
          ),
          onPressed: () => mainLayoutScaffoldKey.currentState!.openDrawer(),
        ),
        title: Image.asset(
          'assets/icons/World Talk.png',
          height: 28.h,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 6.h),
            child: InkWell(
              onTap: () {
                push(context, const ExploreView());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/suggest.png',
                    height: 24.h,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 6.h),
            child: InkWell(
              onTap: () {
                push(context, const NotificationsView());
              },
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
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 90.h),
        child: FloatingActionButton(
          onPressed: () {
            push(context, const CreateFeedView());
          },
          backgroundColor: AppColors.skyBlue,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(12.h),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 28.r,
                      backgroundColor: Colors.grey,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70.r),
                        child: Image.asset('assets/icons/image.png'),
                      ),
                    ),
                    Container(
                      height: 18.h,
                      width: 18.h,
                      decoration: BoxDecoration(
                          color: const Color(0xff1389DF),
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15.h,
                      ),
                    )
                  ],
                ),
                SizedBox(width: 8.h),
                ...List.generate(8, (i) => i)
                    .map(
                      (i) => Container(
                        margin: EdgeInsets.only(right: 8.h),
                        padding: EdgeInsets.all(2.h),
                        decoration: BoxDecoration(
                          color: const Color(0xffCB0ECF),
                          borderRadius: BorderRadius.circular(33.h),
                        ),
                        child: Container(
                            padding: EdgeInsets.all(1.h),
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(33.h),
                            ),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 28.r,
                                  backgroundColor: Colors.grey,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(70.r),
                                    child: Image.asset(
                                        'assets/icons/p${i % 3}.png'),
                                  ),
                                ),
                                Container(
                                  height: 12.h,
                                  width: 12.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff5D8F3F),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                )
                              ],
                            )),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          ListView.separated(
              separatorBuilder: (_, __) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.h),
                    child: Divider(
                        height: 0.h,
                        thickness: 1.h,
                        color: const Color(0xffE7E8EB)),
                  ),
              itemCount: 5,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              physics: const ClampingScrollPhysics(),
              itemBuilder: (_, i) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            '@${names[i % 3]}',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                            fontFamily: 'Poppins',
                          ),
                          SizedBox(height: 3.h),
                          LinkifyText(
                            'In the next 3 days BNB, BTC & ETH will rise to unpresidented price.\n\nI have done my technical ana;ysis, i have monitored the candles carefully. Find below  a picture of my technical analysis of the candles. The analysis was done with my friend @Daysman43\n\nLet me knpw what you think in comment section. #WorldTalkCryptoRise',
                            textStyle: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            linkStyle: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff1389DF),
                            ),
                            linkTypes: const [
                              LinkType.url,
                              LinkType.hashTag,
                              LinkType.userTag
                            ],
                          ),
                          SizedBox(height: 12.h),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.asset(
                              'assets/icons/chart.png',
                              height: 170.h,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/icons/comment.png',
                                height: 24.h,
                              ),
                              SizedBox(width: 4.h),
                              RegularText(
                                '3',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                                fontFamily: 'Poppins',
                              ),
                              SizedBox(width: 20.h),
                              Image.asset(
                                'assets/icons/like0.png',
                                height: 24.h,
                              ),
                              SizedBox(width: 4.h),
                              RegularText(
                                '23',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                                fontFamily: 'Poppins',
                              ),
                              SizedBox(width: 20.h),
                              Image.asset(
                                'assets/icons/share.png',
                                height: 22.h,
                                color: AppColors.black,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
