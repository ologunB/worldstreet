import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/view_models/auth_vm.dart';
import '../widgets/base_view.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_drop_down.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/snackbar.dart';
import '../widgets/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

// kivale@brand-app.biz
class _SignupScreenState extends State<SignupScreen> {
  String? type;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  TextEditingController email = TextEditingController();
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
                  'Continue registration',
                  fontSize: 24.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 17.h),
                RegularText(
                  'Enter the necessary details',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey,
                ),
                SizedBox(height: 24.h),
                CustomDropDownButton(
                  list: ['Staker', 'Trader'],
                  value: type,
                  hintText: 'User Type',
                  onChanged: (a) {
                    type = a;
                    setState(() {});
                  },
                ),
                SizedBox(height: 16.h),
                WorldStreetField(
                  hintText: 'Email address',
                  textInputType: TextInputType.emailAddress,
                  maxLines: 1,
                  validator: Utils.validateEmail,
                  controller: email,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16.h),
                WorldStreetField(
                  hintText: 'Password',
                  controller: password,
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  obscureText: hidePassword,
                  validator: Utils.isValidPassword,
                  textInputAction: TextInputAction.done,
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
                RegularText(
                  '● Password should be 8 to 16 characters',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
                SizedBox(height: 8.h),
                RegularText(
                  '● Use both uppercase and lowercase',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
                SizedBox(height: 8.h),
                RegularText(
                  '● Symbols are not allowed',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
                SizedBox(height: 16.h),
                WorldStreetField(
                  hintText: 'Confirm Password',
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  obscureText: true,
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
                SizedBox(height: 32.h),
                GeneralButton(
                  'Signup',
                  buttonColor: AppColors.skyBlue,
                  borderColor: AppColors.skyBlue,
                  borderRadius: 8.h,
                  fontSize: 14.sp,
                  height: 50.h,
                  busy: model.busy,
                  textColor: AppColors.white,
                  fontWeight: FontWeight.w600,
                  onPressed: () {
                    if (type == null) {
                      showSnackBar(context, 'Error', 'Choose User Type');
                      return;
                    }
                    autoValidate = true;
                    setState(() {});
                    if (formKey.currentState!.validate()) {
                      Utils.offKeyboard();
                      Map<String, dynamic> userData = {
                        'user_type': type,
                        'password1': password.text,
                        'password2': password.text,
                        'country':
                            context.read<AuthViewModel>().selectedCountry?.name,
                        'email': email.text,
                      };

                      model.signup(userData);
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
