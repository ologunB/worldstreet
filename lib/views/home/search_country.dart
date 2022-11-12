import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class SearchCountry extends StatefulWidget {
  const SearchCountry({Key? key, required this.selectedCountries})
      : super(key: key);

  final List<Country> selectedCountries;
  @override
  State<SearchCountry> createState() => _SearchCountryState();
}

class _SearchCountryState extends State<SearchCountry> {
  List<Country> allCountries = [];
  List<Country> selectedCountries = [];
  List<Country> filtered = [];
  @override
  void initState() {
    selectedCountries.addAll(widget.selectedCountries);
    getAll();
    super.initState();
  }

  getAll() async {
    final String coins2 = await rootBundle
        .loadString('assets/icons/countries.json', cache: false);
    List coinsResponse2 = jsonDecode(coins2);

    for (var value in coinsResponse2) {
      allCountries.add(Country.fromJson(value));
      setState(() {});
    }
    filtered.addAll(allCountries);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context, selectedCountries);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 18.h,
                  color: Colors.black,
                ),
              ),
              RegularText(
                'Location',
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context, selectedCountries);
                },
                icon: Icon(
                  Icons.check_rounded,
                  size: 24.h,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.h),
            child: RegularText(
              'All results',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: ItsyTextField(
              hintText: 'Search country',
              textInputType: TextInputType.text,
              maxLines: 1,
              textInputAction: TextInputAction.search,
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.h),
                    child: Image.asset(
                      'assets/icons/search.png',
                      height: 18.h,
                    ),
                  ),
                ],
              ),
              onChanged: (b) {
                String a = b!.trim();
                if (a.isNotEmpty) {
                  a = a.toUpperCase();
                  filtered.clear();
                  for (Country item in allCountries) {
                    if (item.name!.toUpperCase().contains(a)) {
                      filtered.add(item);
                    }
                  }
                } else {
                  filtered.clear();
                  filtered.addAll(allCountries);
                }
                setState(() {});
              },
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: filtered.length,
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 18.h),
                itemBuilder: (_, i) {
                  Country country = filtered[i];
                  bool isCPresent = selectedCountries
                      .any((element) => element.name == country.name);
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: InkWell(
                      onTap: () {
                        if (isCPresent) {
                          selectedCountries.removeWhere(
                              (element) => element.name == country.name);
                        } else {
                          selectedCountries.add(country);
                        }
                        selectedCountries = selectedCountries.toSet().toList();
                        setState(() {});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.h, vertical: 18.h),
                        decoration: BoxDecoration(
                          color:
                              isCPresent ? AppColors.skyBlue : AppColors.white,
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(12.h),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(38.h),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://flagcdn.com/160x120/${country.code!.toLowerCase()}.png',
                                height: 40.h,
                                width: 40.h,
                                fit: BoxFit.fill,
                                placeholder: (_, __) => const SizedBox.shrink(),
                                errorWidget: (_, __, ___) =>
                                    const SizedBox.shrink(),
                              ),
                            ),
                            SizedBox(width: 8.h),
                            Expanded(
                              child: RegularText(
                                country.name!,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: isCPresent
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class Country {
  String? name;
  String? dialCode;
  String? code;

  Country({this.name, this.dialCode, this.code});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dialCode = json['dial_code'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['dial_code'] = dialCode;
    data['code'] = code;
    return data;
  }
}
