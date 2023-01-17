import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../core/view_models/auth_vm.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/snackbar.dart';
import '../widgets/utils.dart';
import 'confirm_passcode.dart';

class SetPasscodeScreen extends StatefulWidget {
  const SetPasscodeScreen({Key? key}) : super(key: key);

  @override
  State<SetPasscodeScreen> createState() => _SetPasscodeScreenState();
}

class _SetPasscodeScreenState extends State<SetPasscodeScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Set Passcode',
              fontSize: 24.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 17.h),
            RegularText(
              'Enter the pass you wish to access your account',
              fontSize: 14.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Pinput(
                  obscureText: true,
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
            SizedBox(height: 56.h),
            GeneralButton(
              'Continue',
              buttonColor: AppColors.skyBlue,
              borderColor: AppColors.skyBlue,
              borderRadius: 8.h,
              fontSize: 14.sp,
              height: 50.h,
              textColor: AppColors.white,
              fontWeight: FontWeight.w600,
              onPressed: () {
                if (controller.text.length != 6) {
                  showSnackBar(
                      context, 'Error', 'Enter your 6-digits passcode');
                  return;
                }
                context.read<AuthViewModel>().passcode1 = controller.text;
                pushReplacement(context, ConfirmPasscodeScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
