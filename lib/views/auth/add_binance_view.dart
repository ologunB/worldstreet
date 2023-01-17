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
  TextEditingController binance = TextEditingController();
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
                  'Add Binance Key',
                  fontSize: 24.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 17.h),
                RegularText(
                  'Enter your key here to get access to your addresses and balances',
                  fontSize: 14.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey,
                ),
                SizedBox(height: 48.h),
                WorldStreetField(
                  hintText: 'Binance Key',
                  textInputType: TextInputType.text,
                  maxLines: 1,
                  controller: binance,
                  textInputAction: TextInputAction.done,
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
                      model.updateAccount(binance.text);
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
