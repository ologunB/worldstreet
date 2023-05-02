import 'package:flutter/cupertino.dart';
import 'package:ft_worldstreet/core/models/binance_model.dart';
import 'package:ft_worldstreet/core/storage/local_storage.dart';
import 'package:ft_worldstreet/views/auth/login_view.dart';
import 'package:ft_worldstreet/views/auth/set_passcode.dart';
import 'package:ft_worldstreet/views/auth/verify_email.dart';
import 'package:ft_worldstreet/views/widgets/search_country.dart';
import 'package:ft_worldstreet/views/widgets/utils.dart';

import '../../locator.dart';
import '../../views/auth/reset_pass2_view.dart';
import '../../views/main_layout.dart';
import '../../views/widgets/color_schema.dart';
import '../../views/widgets/snackbar.dart';
import '../apis/auth_api.dart';
import '../apis/base_api.dart';
import '../models/balances_model.dart';
import '../models/user_model.dart';
import '../utils/navigator.dart';
import 'base_vm.dart';

class AuthViewModel extends BaseModel {
  final AuthApi _authApi = locator<AuthApi>();
  String? error;

  Country? selectedCountry;
  String? passcode1;

  // errrr@eee.eeeee
  Future<void> signup(Map<String, dynamic> a) async {
    setBusy(true);
    try {
      await _authApi.signup(a);
      push(context, VerifyEmailScreen());
      showDialog('Verify your account', 'Success');
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
  }

  Future<void> resendEmail(Map<String, dynamic> a) async {
    setBusy(true);
    try {
      await _authApi.resendEmail(a);
      showDialog('Code has been resent to your email', 'Success');
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
  }

  Future<void> verifyEmail(Map<String, dynamic> a) async {
    setBusy(true);
    try {
      await _authApi.verifyEmail(a);
      push(context, SetPasscodeScreen());
      showDialog('Email has been verified', 'Success');
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
  }

  Future<void> login(Map<String, dynamic> a) async {
    setBusy(true);
    try {
      await _authApi.login(a);
      pushAndRemoveUntil(context, MainLayout());
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
  }

  Future<void> reset(String a) async {
    setBusy(true);
    try {
      await _authApi.reset(a);
      pushReplacement(context, ConfirmPassScreen(email: a));
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
  }

  Future<void> confirmReset(Map<String, dynamic> a) async {
    setBusy(true);
    try {
      await _authApi.confirmReset(a);
      pushAndRemoveUntil(context, LoginScreen());
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
  }

  String get userType =>
      AppCache.getUser()?.userType == 'Trader' ? 'Staker' : 'Trader';

  List<User>? accounts;
  Future<void> getAccounts() async {
    setBusy(true);
    try {
      accounts = await _authApi.getUsersList();
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
    return null;
  }

  List<User>? traders;
  Future<void> getTraderList() async {
    setBusy(true);
    try {
      traders = await _authApi.getTraderList();
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
    return null;
  }

  User? trader;
  Future<void> getOneTrader(int? id) async {
    setBusy(true);
    try {
      trader = await _authApi.getOneTrader(id);
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
    return null;
  }

  Future<void> copyTrader(int? id) async {
    setBusy(true);
    try {
      await _authApi.copyTrader(id);
      showDialog('The Trader\'s trade has been subscribed to.', 'Success');
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
    return null;
  }

  Future<bool> removeTrader(int? id) async {
    setBusy(true);
    try {
      await _authApi.removeTrader(id);
      setBusy(false);
      return true;
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
      return false;
    }
  }

  List<BinanceModel>? allCoins;
  Future<void> getCoins() async {
    setBusy(true);
    try {
      allCoins = await _authApi.getCoins();
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
    return null;
  }

  double totalBalance = 0;
  List<BalanceModel>? balances;
  Future<void> getBalances() async {
    setBusy(true);
    try {
      balances = await _authApi.getBalances();
      balances?.forEach((e) {
        totalBalance = totalBalance + double.parse(e.free!);
      });
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
    }
    return null;
  }

  User? oneAccount;

  Future<void> getOneAccount(int a) async {
    setBusy(true);
    try {
      oneAccount = await _authApi.getOneAccount(a);
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
  }

  Future<void> updateAccount(String api, String secret) async {
    setBusy(true);
    try {
      await _authApi.updateAccount(api, secret);
      pushAndRemoveUntil(context, MainLayout());
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
  }

  void setPasscode(String a) {
    AppCache.setPasscode(a);
  }

  BuildContext get context => AppNavigator.navKey.currentContext!;

  void showDialog(String e, [String? title]) {
    showSnackBar(
      context,
      title ?? 'Error',
      e,
      color: title == null ? AppColors.red : AppColors.skyBlue,
    );
  }
}
