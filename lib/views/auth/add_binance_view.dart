import 'package:flutter/material.dart';

import '../../core/view_models/auth_vm.dart';
import '../widgets/base_view.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/utils.dart';

class AddBinanceScreen extends StatefulWidget {
  const AddBinanceScreen({Key? key}) : super(key: key);

  @override
  State<AddBinanceScreen> createState() => _AddBinanceScreenState();
}

class _AddBinanceScreenState extends State<AddBinanceScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController api = TextEditingController();
  TextEditingController secret = TextEditingController();
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
                  'Add Binance Credentials',
                  fontSize: 24.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 17.h),
                RegularText(
                  'Enter your key and secret here to get access to your addresses and balances',
                  fontSize: 14.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey,
                ),
                SizedBox(height: 48.h),
                WorldStreetField(
                  hintText: 'Binance API Key',
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  controller: api,
                  textInputAction: TextInputAction.next,
                  validator: (a) {
                    return Utils.isValidName(a, 'API Key', 5);
                  },
                ),
                SizedBox(height: 32.h),
                WorldStreetField(
                  hintText: 'Binance Secret Key',
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  controller: secret,
                  textInputAction: TextInputAction.done,
                  validator: (a) {
                    return Utils.isValidName(a, 'Secret Key', 5);
                  },
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
                    autoValidate = true;
                    setState(() {});
                    if (formKey.currentState!.validate()) {
                      Utils.offKeyboard();
                      model.updateAccount(secret.text, api.text);
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
