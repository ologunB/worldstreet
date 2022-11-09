import 'dart:io';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/data/models/lastlogin_model.dart';

import 'package:ft_worldstreet/data/network/api_client.dart';
import 'package:ft_worldstreet/data/pref/app_preferences.dart';
import 'package:ft_worldstreet/views/global_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginScreenController extends GetxController {
  final globalController = Get.put<GlobalController>(GlobalController());

  TextEditingController userEmailController = TextEditingController();
  FocusNode userEmailFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  RxString userEmailString = "".obs;
  RxString userPasswordString = "".obs;
  RxBool showPass = false.obs;

  Future<void> apiCallForLogin() async {
    Map<String, dynamic> paras = {
      "email": userEmailController.text,
      "password": passwordController.text,
      "device_token": "device_token",
      "device_os": Platform.operatingSystem,
      "device_os_version": (Platform.isAndroid)
          ? globalController.androidInfo?.version.release ?? ""
          : globalController.iosInfo?.systemVersion ?? "",
      "device_model": (Platform.isAndroid)
          ? globalController.androidInfo?.model ?? ""
          : globalController.iosInfo?.model ?? "",
      "ip_address": globalController.packageInfo?.version ?? "123"
    };
    try {
      final response = await ApiService.makeApiCall("login", ApiMethodType.post,
          params: paras);
      globalController.lastLoginModel.value =
          LastLoginModel.fromJson(response['data']);
      AppPref().isLogin = true;
      AppPref().token =
          globalController.lastLoginModel.value.userSessionToken ?? "";
      globalController.goNextIfProfileIsNotCompelete(orElse: () {
        Get.offAllNamed(AppRouter.bottomNavigationBarScreen);
      });
    } catch (e) {
      return;
    }
  }

  // Future<String?> signInWithGoogle() async {
  //   try {
  //     UserCredential? userCredential;
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser!.authentication;
  //     final AuthCredential googleAuthCredential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     final FirebaseAuth googleuser = FirebaseAuth.instance;
  //     userCredential = await googleuser
  //         .signInWithCredential(googleAuthCredential)
  //         .then((value) {
  //       googleLogInApiCall(
  //           email: value.user!.email,
  //           name: value.user!.displayName,
  //           userId: value.user!.uid);
  //       print("google user email => ${value.user?.email}");
  //       print("google displayName => ${value.user?.displayName}");
  //       print("google uid => ${value.user?.uid}");
  //     });
  //   } catch (e) {
  //     print("Firebase google sign in error=====> " + e.toString());
  //   }
  // }
  //
  // Future<String?> signInWithFacebook() async {
  //   print("FaceBook");
  //   try {
  //     final result =
  //         await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
  //     if (result.status == LoginStatus.success) {
  //       final userData = await FacebookAuth.i.getUserData().then((value) {
  //         // print(value['id']);
  //
  //         print("facebook email => ${value['email'] ?? ""}");
  //         print("facebook name => ${value['name'] ?? ""}");
  //         print("facebookUserId => ${value['id'] ?? ""}");
  //       });
  //       print("this is facebook userdata    ====> ${userData}");
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }
  //
  // Future<void> googleLogInApiCall({String? name, String? email, String? userId}) async {
  //   Map<String, dynamic> paras = {
  //     "type": "google",
  //     "email": email,
  //     "id": userId,
  //     "country_id": "2",
  //     "user_type": "Traders",
  //     "device_token": "device_token",
  //     "device_os": "device_os",
  //     "device_os_version": "device_os_version",
  //     "device_model": "device_model",
  //     "ip_address": "ip_address"
  //   };
  //   print(paras);
  //
  //   try {
  //     final response = await ApiService.makeApiCall(
  //         "social-login", ApiMethodType.post,
  //         params: paras);
  //     AppPref().token = response["data"]["user_session_token"];
  //     AppPref().email = response["data"]["email"];
  //     print(email);
  //     Get.toNamed(AppRouter.selectCityScreen);
  //   } catch (e) {
  //     return;
  //   }
  // }

  @override
  void onInit() async {
    super.onInit();
    //
    // userEmailController.text = "jp@yopmail.com";
    // passwordController.text = "Jp123456";
    // userEmailString.value = "test@gmail.com";
    // userPasswordString.value = "12345678";
  }
}
