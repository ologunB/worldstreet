import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import '../auth/login_view.dart';
import '../widgets/custom_text.dart';
import 'change_pass_view.dart';
import 'change_pin_view.dart';
import 'edit_account_view.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24.h),
          children: [
            RegularText(
              'Settings',
              fontSize: 18.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 24.h),
            CircleAvatar(
              radius: 23.h,
              backgroundColor: Color(0xff291CC0),
              child: Image.asset('assets/icons/person.png'),
            ),
            SizedBox(height: 12.h),
            RegularText(
              'Emmanuel o.',
              fontSize: 16.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 3.h),
            RegularText(
              '@emmanuelO',
              fontSize: 12.sp,
              textAlign: TextAlign.center,
              color: AppColors.greyDark1,
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    push(context, EditAccountScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE7FDEB),
                      borderRadius: BorderRadius.circular(20.h),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.h, vertical: 6.h),
                    child: RegularText(
                      'Edit Profile',
                      fontSize: 12.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            ListView.separated(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (_, i) {
                return InkWell(
                  onTap: () {
                    if (i == 0) {
                      push(context, ChangePassScreen());
                    } else if (i == 1) {
                      push(context, ChangePINScreen());
                    } else if (i == 2) {
                      pushAndRemoveUntil(context, LoginScreen());
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.h),
                      border: Border.all(
                        color: Color(0xffCDCDCD),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 22.h, horizontal: 17),
                    child: Row(
                      children: [
                        RegularText(
                          ['Change Password', 'Change PIN', 'Logout'][i],
                          fontSize: 16.sp,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16.h,
                          color: AppColors.black,
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, __) => SizedBox(height: 12),
              itemCount: 3,
            )
          ],
        ),
      ),
    );
  }
}
