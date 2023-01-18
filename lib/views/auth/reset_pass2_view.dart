import 'package:flutter/material.dart';

import '../../core/view_models/auth_vm.dart';
import '../widgets/base_view.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/utils.dart';

class ConfirmPassScreen extends StatefulWidget {
  const ConfirmPassScreen({Key? key, required this.email}) : super(key: key);

  final String email;
  @override
  State<ConfirmPassScreen> createState() => _ConfirmPassScreenState();
}

class _ConfirmPassScreenState extends State<ConfirmPassScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  TextEditingController code = TextEditingController();
  TextEditingController password = TextEditingController();
  bool autoValidate = false;
  @override
  Widget build(BuildContext context) {
    return BaseView<AuthViewModel>(
      builder: (_, AuthViewModel model, __) => Form(
        key: formKey,
        autovalidateMode:
            autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: Scaffold(
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
                  'Enter a new password different from the one you\nused previously',
                  fontSize: 14.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey,
                ),
                SizedBox(height: 32.h),
                WorldStreetField(
                  hintText: 'Enter OTP sent',
                  textInputType: TextInputType.number,
                  maxLines: 1,
                  controller: code,
                  textInputAction: TextInputAction.next,
                  validator: (a) {
                    return Utils.isValidName(a, 'OTP', 6);
                  },
                ),
                SizedBox(height: 16.h),
                WorldStreetField(
                  hintText: 'Enter new password',
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  controller: password,
                  textInputAction: TextInputAction.next,
                  obscureText: hidePassword,
                  validator: Utils.isValidPassword,
                  suffixIcon: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          hidePassword = !hidePassword;
                          setState(() {});
                        },
                        child: Icon(
                          hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 22.h,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                WorldStreetField(
                  hintText: 'Confirm new password',
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  obscureText: hidePassword,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    } else if (value != password.text) {
                      return "Passwords are different";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                SizedBox(height: 32.h),
                GeneralButton(
                  'Reset Password',
                  buttonColor: AppColors.skyBlue,
                  borderColor: AppColors.skyBlue,
                  borderRadius: 8.h,
                  fontSize: 14.sp,
                  height: 50.h,
                  busy: model.busy,
                  textColor: AppColors.white,
                  fontWeight: FontWeight.w600,
                  onPressed: () {
                    autoValidate = true;
                    setState(() {});
                    if (formKey.currentState!.validate()) {
                      Utils.offKeyboard();
                      Map<String, dynamic> userData = {
                        'email': widget.email,
                        'otp': code.text,
                        'new_password1': password.text,
                        'new_password2': password.text,
                      };
                      model.confirmReset(userData);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
