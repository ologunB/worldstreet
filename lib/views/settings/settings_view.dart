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
              fontSize: 24.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 50.h),
            CircleAvatar(
              radius: 28.h,
              backgroundColor: Color(0xff291CC0),
              child: RegularText(
                'E',
                fontSize: 32.sp,
                textAlign: TextAlign.center,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 18.h),
            RegularText(
              'Emmanuel Omale',
              fontSize: 20.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 12.h),
            RegularText(
              '@emmanuelO',
              fontSize: 14.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              color: AppColors.greyDark1,
            ),
            SizedBox(height: 18.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    push(context, EditAccountScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff10F75F),
                      borderRadius: BorderRadius.circular(20.h),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.h, vertical: 14.h),
                    child: RegularText(
                      'Edit Profile',
                      fontSize: 16.sp,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.h),
                ),
                child: ListView.separated(
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
                        child: Padding(
                          padding: EdgeInsets.all(20.h),
                          child: Row(
                            children: [
                              RegularText(
                                ['Change Password', 'Change PIN', 'Logout'][i],
                                fontSize: 18.sp,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w500,
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16.h,
                                color: AppColors.greyDark1,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => Divider(
                          height: 0,
                          color: AppColors.baground,
                        ),
                    itemCount: 3))
          ],
        ),
      ),
    );
  }
}
