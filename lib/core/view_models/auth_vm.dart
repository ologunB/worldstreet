import 'package:flutter/cupertino.dart';

import '../../locator.dart';
import '../../utils/color_schema.dart';
import '../../views/widgets/snackbar.dart';
import '../apis/auth_api.dart';
import '../apis/base_api.dart';
import '../utils/navigator.dart';
import 'base_vm.dart';

class AuthViewModel extends BaseModel {
  final AuthApi _authApi = locator<AuthApi>();
  String? error;

  Future<List?> signup(Map<String, dynamic> a) async {
    setBusy(true);
    try {
      dynamic res = await _authApi.signup(a);
      if (res is List) {
        showDialog(
            'Username has been chosen, change or choose from the below list');
        setBusy(false);
        return res.toSet().toList();
      }

      showDialog('Verify your account', res);
      setBusy(false);
    } on CustomException catch (e) {
      error = e.message;
      setBusy(false);
      showDialog(e.message);
    }
    return null;
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
