// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart' hide Response, FormData, MultipartFile;
// import 'package:imagestack/app_route.dart';
// import 'package:imagestack/components/Common/common_fun.dart';
// import 'package:imagestack/data/pref/app_preferences.dart';
// import 'package:imagestack/utils/app_toast.dart';
//
// // ignore: missing_return
// Future<dynamic> uploadFile(
//   BuildContext context, {
//   List<File>? files,
//   File? file,
//   List<int>? bytes,
//   String? nickName,
//   String? email,
//   bool pdfUpload = false,
// }) async {
//   var dio = Dio();
//
//   dio.options.headers["token"] = PrefUtils.getInstance.readData(
//     PrefUtils.getInstance.accessToken,
//   );
//   // if (kDebugMode) {
//   //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//   //       (client) {
//   //     client.findProxy = (uri) => "PROXY 192.168.1.4:8888"; //HOME
//   //   };
//   // }
//
//   Response response;
//   var formData1 = await formdata(
//       files: files!,
//       file: file,
//       bytes: bytes!,
//       email: email,
//       nickName: nickName);
//
//   // var uploadProgressWidget = UploadProgress(state: _UploadProgressState());
//   // final settingScreenController = Get.find<SettingScreenController>();
//
//   response = await dio.post(
//     ApiConstants.ProfileEditUrl,
//     data: formData1,
//     onSendProgress: (received, total) {},
//   );
//   String message = response.data['message'];
//   String result = response.data['result'];
//   final body = response;
//
//   if (result == "success") {
//     message = body.data['message'] ?? "";
//     result = body.data['result'] ?? "";
//
//     if (response.statusCode == 200) {
//
//       print(response);
//       Get.back();
//       Get.back();
//       showAppToast(message.toString());
//
//     }
//   } else if (message == "Login Expired") {
//     AppPref().clear();
//     Get.offAllNamed(AppRouter.logInScreen);
//   } else {
//     // ignore: avoid_print
//     // CustomDialogs.getInstance.hideProgressDialog();
//
//     print(message);
//     if (!isNullEmptyOrFalse(message)) {
//       Get.back();
//       showAppToast(
//         message
//       );
//     }
//   }
// }
//
// Future<FormData> formdata(
//     {List<File>? files,
//     File? file,
//     List<int>? bytes,
//     String? nickName,
//     String? email,
//     bool pdfUpload = false}) async {
//
//   // String fileName = file!.path.split('/').last;
//
//   FormData data = FormData.fromMap({
//     if (file != null)
//       "profile_pic": await MultipartFile.fromFile(
//         file.path,
//       ),
//     "user_id": AppPref().userId,
//     "name": nickName,
//     "email": email,
//   });
//   return data;
// }
