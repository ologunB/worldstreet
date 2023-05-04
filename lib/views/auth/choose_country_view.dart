import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/search_country.dart';

class ChooseCountryScreen extends StatefulWidget {
  const ChooseCountryScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCountryScreen> createState() => _ChooseCountryScreenState();
}

class _ChooseCountryScreenState extends State<ChooseCountryScreen> {
  List<Country> allCountries = [];
  Country? selectedCountry;
  List<Country> filtered = [];

  @override
  void initState() {
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
  Widget build(BuildContext _) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.black),
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.h),
        child: GeneralButton(
          'Continue',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 14.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w600,
          onPressed: selectedCountry == null
              ? null
              : () {
                  Navigator.pop(context, selectedCountry);
                },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularText(
              'Where do you live?',
              fontSize: 24.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 17.h),
            RegularText(
              'Choose the country where you currently reside',
              fontSize: 14.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
            SizedBox(height: 28.h),
            WorldStreetField(
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
            SizedBox(height: 8.h),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: filtered.length,
                  padding: EdgeInsets.symmetric(vertical: 18.h),
                  itemBuilder: (_, i) {
                    Country country = filtered[i];

                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: InkWell(
                        onTap: () {
                          selectedCountry = country;

                          setState(() {});
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.h, vertical: 18.h),
                          decoration: BoxDecoration(
                            color: selectedCountry?.name == country.name
                                ? AppColors.skyBlue
                                : AppColors.white,
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
                                  placeholder: (_, __) =>
                                      const SizedBox.shrink(),
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
                                  color: selectedCountry?.name == country.name
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
      ),
    );
  }
}
