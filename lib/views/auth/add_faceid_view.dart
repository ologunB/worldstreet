import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import '../../core/storage/local_storage.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/snackbar.dart';
import '../widgets/utils.dart';
import 'select_space_view.dart';

class AddFaceIDScreen extends StatefulWidget {
  const AddFaceIDScreen({Key? key}) : super(key: key);

  @override
  State<AddFaceIDScreen> createState() => _AddFaceIDScreenState();
}

class _AddFaceIDScreenState extends State<AddFaceIDScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.black),
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.h),
        child: GeneralButton(
          'Continue',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 14.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w600,
          onPressed: enableBiometric,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularText(
                'Face authentication',
                fontSize: 24.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 17.h),
              RegularText(
                'Add a face authentication to make your account more secure',
                fontSize: 14.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                color: AppColors.grey,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Image.asset(
                      'assets/icons/faceid.png',
                      height: 156.h,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  final LocalAuthentication auth = LocalAuthentication();

  void enableBiometric() async {
    try {
      bool didAuthenticate =
          await auth.authenticate(localizedReason: 'Setup Biometric');
      AppCache.hasBiometric(didAuthenticate);
      if (didAuthenticate) push(context, SelectSpaceScreen());
      setState(() {});
    } catch (e) {
      showSnackBar(context, null, e.toString());
    }
  }
}
