import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ft_worldstreet/app_route.dart';
import 'package:ft_worldstreet/data/network/api_client.dart';
import 'package:ft_worldstreet/views/global_controller.dart';
import 'package:get/get.dart';

import '../../../data/models/binance_model.dart';

class SelectSpacesScreenController extends GetxController {
  final globalController = Get.put<GlobalController>(GlobalController());
  TextEditingController forexkeyController = TextEditingController();
  FocusNode forexkeyFocusNode = FocusNode();
  TextEditingController forexsecretController = TextEditingController();
  FocusNode forexFocusNode = FocusNode();
  TextEditingController cryptoController = TextEditingController();
  FocusNode cryptoFocusnode = FocusNode();
  TextEditingController cryptosecretcontroller = TextEditingController();
  FocusNode cryptosecretFocusNode = FocusNode();
  RxBool onpressForex = false.obs;
  RxBool onpressCrypto = false.obs;

  Future<void> apiCallForUpdateSpaces() async {
    Map<String, dynamic> paras = {
      "forex": onpressForex.value ? 1 : 0,
      "forex_key": forexkeyController.text,
      "forex_secret": forexsecretController.text,
      "crypto": onpressCrypto.value ? 1 : 0,
      "crypto_key": cryptoController.text,
      "crypto_secret": cryptosecretcontroller.text
    };
    try {
      final response = await ApiService.makeApiCall(
          "update-spaces", ApiMethodType.post,
          params: paras);

      if (response['data']['crypto_json'] != null) {
        dynamic data = jsonDecode(response['data']['crypto_json']);

        List<BinanceModal> balances = (data['balances'] as List)
            .map((p) => BinanceModal.fromJson(p))
            .toList();

        BinanceModal usdt =
            balances.where((element) => (element.asset == "USDT")).first;
        if (kDebugMode) {
          print(usdt.free);
        }

        globalController
            .updatebinance(double.parse(usdt.free!).toStringAsFixed(2));
      }

      Get.toNamed(AppRouter.bottomNavigationBarScreen);
    } catch (e) {
      return;
    }
  }

  Future<void> apiCallForSkipSpaces() async {
    Map<String, dynamic> paras = {
      "forex": 1,
      "forex_key": "s",
      "forex_secret": "s",
      "crypto": 0,
      "crypto_key": "",
      "crypto_secret": ""
    };
    try {
      await ApiService.makeApiCall("update-spaces", ApiMethodType.post,
          params: paras);

      Get.toNamed(AppRouter.bottomNavigationBarScreen);
    } catch (e) {
      return;
    }
  }
}
