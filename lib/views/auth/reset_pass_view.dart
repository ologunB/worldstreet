import 'package:flutter/material.dart';

import '../../core/view_models/auth_vm.dart';
import '../widgets/base_view.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/snackbar.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({Key? key}) : super(key: key);

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                'Forgot Password',
                fontSize: 24.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 17.h),
              RegularText(
                'Enter your email address here',
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
                controller: email,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 32.h),
              GeneralButton(
                'Confirm',
                buttonColor: AppColors.skyBlue,
                borderColor: AppColors.skyBlue,
                borderRadius: 8.h,
                fontSize: 14.sp,
                height: 50.h,
                busy: model.busy,
                textColor: AppColors.white,
                fontWeight: FontWeight.w600,
                onPressed: () {
                  if (email.text.isEmpty) {
                    showSnackBar(context, 'Error', 'Enter your email');
                    return;
                  }
                  model.reset(email.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
