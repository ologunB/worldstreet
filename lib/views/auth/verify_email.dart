import 'package:flutter/material.dart';
import 'package:ft_worldstreet/core/storage/local_storage.dart';
import 'package:ft_worldstreet/views/auth/set_passcode.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';
import 'package:pinput/pinput.dart';

import '../../core/view_models/auth_vm.dart';
import '../widgets/base_view.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/snackbar.dart';

class VerifyEmailScreen extends StatefulWidget {
  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String email = AppCache.getUser()?.email ?? '';
    return BaseView<AuthViewModel>(
      builder: (_, AuthViewModel model, __) => Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.black),
          elevation: 0,
          backgroundColor: AppColors.white,
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(24.h),
            children: [
              RegularText(
                'Verify Email Address',
                fontSize: 24.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 17.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Enter the 6-digit verification code sent to your\nemail ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey,
                      ),
                    ),
                    TextSpan(
                      text: email,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        color: AppColors.skyBlue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                children: [
                  Pinput(
                    length: 6,
                    controller: controller,
                    defaultPinTheme: PinTheme(
                      width: 48.h,
                      height: 64.h,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.skyBlue),
                        borderRadius: BorderRadius.circular(12.h),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      model.resendEmail({'email': email});
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: AppColors.grey,
                          size: 20.h,
                        ),
                        SizedBox(width: 8.h),
                        RegularText(
                          'Resend code',
                          fontSize: 14.sp,
                          fontFamily: 'Gilroy',
                          color: AppColors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48.h),
              GeneralButton(
                'Verify',
                buttonColor: AppColors.skyBlue,
                borderColor: AppColors.skyBlue,
                borderRadius: 8.h,
                fontSize: 14.sp,
                height: 50.h,
                textColor: AppColors.white,
                busy: model.busy,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  push(context, SetPasscodeScreen());
                  return;
                  if (controller.length != 6) {
                    showSnackBar(
                        context, 'Error', 'Enter the code sent to email');
                    return;
                  }
                  model.resendEmail({'key': email});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
