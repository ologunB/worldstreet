import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricUtils {
  static LocalAuthentication localAuth = LocalAuthentication();
  static String biometricType = 'Fingerprint';
  static bool isFaceIdEnable = false;

  static void getAvailableBiometric() async {
    if (Platform.isIOS) {
      List<BiometricType> availableBiometrics =
          await LocalAuthentication().getAvailableBiometrics();
      if (kDebugMode) {
        print(availableBiometrics);
      }
    }
  }

  void doBiometricAuthentication(String message,
      {Function? onAuthenticate,
      Function(PlatformException?)? onUnAuthenticate}) async {
    bool canCheckBiometrics = await localAuth.canCheckBiometrics;
    if (canCheckBiometrics) {
      bool didAuthenticate = false;
      try {
        didAuthenticate =
            await localAuth.authenticate(localizedReason: message);
        if (didAuthenticate) {
          onAuthenticate!();
        } else {
          onUnAuthenticate!(PlatformException(message: "cancel", code: ''));
        }
      } on PlatformException catch (exc) {
        // Get.offAllNamed(AppRouter.bottomNavigationBarScreen);
        onUnAuthenticate!(exc);
      }
    } else {
      // Get.offAllNamed(AppRouter.bottomNavigationBarScreen);
      onUnAuthenticate!(null);
    }
  }
}
