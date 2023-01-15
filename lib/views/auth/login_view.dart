import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/home/main_layout.dart';

import '../../core/view_models/auth_vm.dart';
import '../widgets/base_view.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/utils.dart';
import 'choose_country_view.dart';
import 'reset_pass_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      builder: (_, AuthViewModel model, __) => Scaffold(
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RegularText(
                  'Don’t have an account? ',
                  fontSize: 15.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                ),
                InkWell(
                  onTap: () {
                    push(context, ChooseCountryScreen());
                  },
                  child: RegularText(
                    'Register Now',
                    fontSize: 15.sp,
                    fontFamily: 'Gilroy',
                    color: AppColors.skyBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(24.h),
            children: [
              RegularText(
                'Welcome Back',
                fontSize: 24.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 17.h),
              RegularText(
                'Hello here, sign in to continue!',
                fontSize: 14.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                color: AppColors.grey,
              ),
              SizedBox(height: 48.h),
              WorldStreetField(
                hintText: 'Email address',
                textInputType: TextInputType.emailAddress,
                maxLines: 1,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 16.h),
              WorldStreetField(
                hintText: 'Password',
                textInputType: TextInputType.text,
                maxLines: 1,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      push(context, ResetPassScreen());
                    },
                    child: RegularText(
                      'Forgot password?',
                      fontSize: 14.sp,
                      fontFamily: 'Gilroy',
                      color: AppColors.skyBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              GeneralButton(
                'Login',
                buttonColor: AppColors.skyBlue,
                borderColor: AppColors.skyBlue,
                borderRadius: 8.h,
                fontSize: 14.sp,
                height: 50.h,
                textColor: AppColors.white,
                fontWeight: FontWeight.w600,
                onTap: () {
                  pushReplacement(context, MainLayout());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
