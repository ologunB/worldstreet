import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/utils.dart';
import 'notification_view.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  List<int> all = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: SafeArea(
          child: GeneralButton(
            'Proceed',
            buttonColor: AppColors.skyBlue,
            borderColor: AppColors.skyBlue,
            borderRadius: 16.h,
            fontSize: 16.sp,
            height: 56.h,
            textColor: AppColors.white,
            fontWeight: FontWeight.w600,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
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
          'Explore',
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        actions: [
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
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          ItsyTextField(
            hintText: 'Find Interest',
            textInputType: TextInputType.text,
            maxLines: 1,
            textInputAction: TextInputAction.search,
            suffixIcon: Padding(
              padding: EdgeInsets.all(12.h),
              child: Image.asset(
                'assets/icons/search.png',
                height: 24.h,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          ListView.builder(
              itemCount: 5,
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
                            child: Image.asset('assets/icons/image.png')),
                      ),
                      SizedBox(width: 16.h),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RegularText(
                              'Daysm23t',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                              fontFamily: 'Poppins',
                            ),
                            SizedBox(height: 3.h),
                            RegularText(
                              '\$1,000,000 market value\n\$10,000,000 Profit.',
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                              fontFamily: 'Poppins',
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (all.contains(i)) {
                            all.remove(i);
                          } else {
                            all.add(i);
                          }
                          setState(() {});
                        },
                        child: Container(
                          width: 100.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: BoxDecoration(
                            color: all.contains(i)
                                ? AppColors.skyBlue
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: all.contains(i)
                                  ? AppColors.skyBlue
                                  : AppColors.grey,
                            ),
                          ),
                          child: RegularText(
                            all.contains(i) ? 'Following' : 'Follow',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: all.contains(i)
                                ? AppColors.white
                                : AppColors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
