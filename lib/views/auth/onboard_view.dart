import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import 'login_view.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.h),
        child: GeneralButton(
          'Continue',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 14.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w600,
          onTap: () {
            push(context, LoginScreen());
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/onboard.png', height: 170.h),
            SizedBox(height: 73.h),
            RegularText(
              'Welcome to a world of wealth',
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 17.h),
            RegularText(
              'Sandra Fredriksson RFID. Filopod tillväxtföretag\ngenade. Barbro tosa. Rune Löfgren',
              fontSize: 14.sp,
              textAlign: TextAlign.center,
              color: AppColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
