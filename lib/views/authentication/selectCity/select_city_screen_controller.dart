import 'package:flutter/material.dart';
import 'package:ft_worldstreet/components/common_function.dart';

import 'package:ft_worldstreet/utils/constant.dart';
import 'package:get/get.dart';

class SelectCityScreenController extends GetxController {
  TextEditingController searchCityController = TextEditingController();
  FocusNode searchCityFocusNode = FocusNode();
  // RxList<SelectCityModel> countryList = <SelectCityModel>[].obs;
  // RxList<SelectCityModel> tempCountryList = <SelectCityModel>[].obs;
  RxInt isSelectedChoiceIndex = 0.obs;
  RxList<CountryModel> countryModelList = <CountryModel>[].obs;
  RxList<CountryModel> tempCountryModelList = <CountryModel>[].obs;

  // Future<void> apiCallForSelectCity() async {
  //   Map<String, dynamic> paras = {};
  //   try {
  //     final response = await ApiService.makeApiCall(
  //         "get-all-country", ApiMethodType.get,
  //         doShowLoader: false, params: paras);

  //     response['data'].forEach((ele) {
  //       countryList.add(SelectCityModel.fromJson(ele));
  //     });
  //     tempCountryList.addAll(countryList);

  //     update();
  //     print("=================> $countryList");
  //   } catch (e) {
  //     return;
  //   }
  // }

  void searchCountry({String searchValue = ""}) {
    tempCountryModelList.clear();
    if (!isNullEmptyOrFalse(searchValue)) {
      for (int i = 0; i < countryModelList.length; i++) {
        if (((countryModelList[i].name).toLowerCase())
            .startsWith(searchValue.toLowerCase())) {
          tempCountryModelList.add(countryModelList[i]);
        }
      }
    } else {
      tempCountryModelList.addAll(countryModelList);
    }
  }

  void getCountriesData() {
    tempCountryModelList.clear();
    for (var value in Constant.countriesList) {
      countryModelList.add(
        CountryModel(
          image: 'assets/flags/${value['code'].toLowerCase()}.png',
          name: value["name"]!,
        ),
      );
    }
    tempCountryModelList.addAll(countryModelList);
  }

  @override
  void onInit() {
    // apiCallForSelectCity();
    getCountriesData();
    super.onInit();
  }
}

class CountryModel {
  final String image;
  final String name;

  const CountryModel({
    required this.image,
    required this.name,
  });
}
