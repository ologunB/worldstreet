import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ft_worldstreet/views/auth/add_faceid_view.dart';
import 'package:ft_worldstreet/views/auth/select_space_view.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../core/view_models/auth_vm.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/snackbar.dart';

class ConfirmPasscodeScreen extends StatefulWidget {
  const ConfirmPasscodeScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmPasscodeScreen> createState() => _ConfirmPasscodeScreenState();
}

class _ConfirmPasscodeScreenState extends State<ConfirmPasscodeScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    _checkBiometrics();
    super.initState();
  }

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
              'Re-enter Passcode',
              fontSize: 24.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 17.h),
            RegularText(
              'Enter the passcode again',
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
                AuthViewModel vm = context.read<AuthViewModel>();
                if (controller.text.length != 6) {
                  showSnackBar(
                      context, 'Error', 'Enter your 6-digits passcode');
                  return;
                }
                if (controller.text != vm.passcode1) {
                  showSnackBar(context, 'Error',
                      'Passcode doesn\'t match with previous passcode');
                  return;
                }
                vm.setPasscode(controller.text);
                if (canCheckBiometrics) {
                  pushReplacement(context, AddFaceIDScreen());
                } else {
                  pushReplacement(context, SelectSpaceScreen());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool canCheckBiometrics = false;
  final LocalAuthentication auth = LocalAuthentication();
  List<BiometricType> availableBiometrics = [];

  Future<void> _checkBiometrics() async {
    try {
      canCheckBiometrics =
          (await auth.canCheckBiometrics && await auth.isDeviceSupported());
    } on PlatformException catch (e) {
      print(e);
    }

    if (canCheckBiometrics) {
      try {
        availableBiometrics = await auth.getAvailableBiometrics();
      } on PlatformException catch (e) {
        print(e);
      }
    }
    canCheckBiometrics = canCheckBiometrics && availableBiometrics.isNotEmpty;

    setState(() {});
  }
}
