import 'package:fluttertoast/fluttertoast.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';

void showAppToast(String? msg) {
  if (msg == null || msg.isEmpty) {
    return;
  }
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: AppColors.primary,
    textColor: AppColors.white,
    fontSize: 14,
    gravity: ToastGravity.BOTTOM,
  );
}

void showErrorToast(String? msg) {
  if (msg == null || msg.isEmpty) {
    return;
  }
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: AppColors.red,
    textColor: AppColors.white,
    fontSize: 14,
    gravity: ToastGravity.BOTTOM,
  );
}
