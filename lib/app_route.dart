import 'package:ft_worldstreet/views/authentication/emailVerification/email_verification_screen.dart';
import 'package:ft_worldstreet/views/authentication/faceAuth/face_auth_screen.dart';
import 'package:ft_worldstreet/views/authentication/forgotPassword/emailPasswordVerification/email_password_verification_screen.dart';
import 'package:ft_worldstreet/views/authentication/forgotPassword/forgotPasswordOtpscreen/forgot_password_otpscreen.dart';
import 'package:ft_worldstreet/views/authentication/forgotPassword/forgot_password_screen.dart';
import 'package:ft_worldstreet/views/authentication/logIn/login_screen.dart';
import 'package:ft_worldstreet/views/authentication/passcode/passcode_screen.dart';
import 'package:ft_worldstreet/views/authentication/passcode/reenter_passcode_screen.dart';
import 'package:ft_worldstreet/views/authentication/passcode/verify_passcode_screen.dart';
import 'package:ft_worldstreet/views/authentication/register/register_screen.dart';
import 'package:ft_worldstreet/views/authentication/selectCity/select_city_screen.dart';
import 'package:ft_worldstreet/views/authentication/verifyIdentity/verify_identity_screen.dart';
import 'package:ft_worldstreet/views/home/main_layout.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'country_select.dart';
import 'views/authentication/selectspace/key_secret_screen.dart';
import 'views/authentication/selectspace/select_space_screen.dart';
import 'views/authentication/splashScreen/on_boarding_screen.dart';
import 'views/authentication/splashScreen/splash_screen.dart';

class AppRouter {
  static const splashScreen = '/splashScreen';
  static const onBoardingScreen = '/onBoardingScreen';
  static const selectCityScreen = '/selectCityScreen';
  static const loginScreen = '/loginScreen';
  static const registerScreen = '/registerScreen';
  static const passcodeScreen = '/passcodeScreen';
  static const verifyPasscodeScreen = '/verifyPasscodeScreen';
  static const verifyIdentityScreen = '/verifyIdentityScreen';
  static const leaderScreen = '/leaderScreen';
  static const bottomNavigationBarScreen = '/bottomNavigationBarScreen';
  static const spacesScreen = '/spacesScreen';
  static const profileScreen = '/profileScreen';
  static const homeScreen = '/homeScreen';
  static const journalScreen = '/journalScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const emailPasswordVerificationScreen =
      '/emailPasswordVerificationScreen';
  static const emailVerificationScreen = '/emailVerificationScreen';
  static const reEnterPasscodeScreen = '/reEnterPasscodeScreen';
  static const faceAuthScreen = '/faceAuthScreen';
  static const forgotPasswordOtpScreen = '/forgotPasswordOtpScreen';
  static const countrySelect = '/countrySelect';
  static const selectSpaceScreen = '/selectSpaceScreen';
  static const newSplashScreen = '/newSplashScreen';
  static const selectSpacesscreen = '/selectSpacesscreen';
  static const drawerScreen = '/drawerScreen';

  static List<GetPage> getPages = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: onBoardingScreen,
      page: () => const OnBoardingScreen(),
    ),
    GetPage(
      name: selectCityScreen,
      page: () => const SelectCityScreen(),
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: emailPasswordVerificationScreen,
      page: () => const EmailPasswordVerificationScreen(),
    ),
    GetPage(
      name: registerScreen,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      name: emailVerificationScreen,
      page: () => const EmailVerificationScreen(),
    ),
    GetPage(
      name: faceAuthScreen,
      page: () => const FaceAuthScreen(),
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: passcodeScreen,
      page: () => const PasscodeScreen(),
    ),
    GetPage(
      name: verifyPasscodeScreen,
      page: () => VerifyPasscodeScreen(),
    ),
    GetPage(
      name: reEnterPasscodeScreen,
      page: () => const ReEnterPasscodeScreen(),
    ),
    GetPage(
      name: verifyIdentityScreen,
      page: () => const VerifyIdentityScreen(),
    ),
    GetPage(
      name: bottomNavigationBarScreen,
      page: () => const MainLayout(),
    ),
    GetPage(
      name: forgotPasswordOtpScreen,
      page: () => const ForgotPasswordOtpScreen(),
    ),
    GetPage(
      name: countrySelect,
      page: () => const CountrySelect(),
    ),
    GetPage(
      name: selectSpaceScreen,
      page: () => const SelectSpaceScreen(),
    ),
    GetPage(
      name: selectSpacesscreen,
      page: () => const KeySecretScreen(),
    ),
  ];
}
