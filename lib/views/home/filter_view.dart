import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ft_worldstreet/views/home/search_country.dart';

import '../widgets/amount_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class FilterView extends StatefulWidget {
  const FilterView({Key? key}) : super(key: key);

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  List<Country> selectedCountries = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.h),
          topRight: Radius.circular(20.h),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.h),
        children: [
          RegularText(
            'Filter',
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          RegularText(
            'All categories',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 24.h),
          RegularText(
            'Profit',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          StakeField(
            title: '',
            amountChanged: (a) {},
            currencyChanged: (a) {},
          ),
          RegularText(
            'Location',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 8.h,
            runSpacing: 8.h,
            children: selectedCountries
                .map(
                  (e) => Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.h),
                      border: Border.all(color: AppColors.lightGrey),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.h),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://flagcdn.com/160x120/${e.code?.toLowerCase()}.png',
                            height: 18.h,
                            width: 18.h,
                            placeholder: (_, __) => const SizedBox.shrink(),
                            errorWidget: (_, __, ___) =>
                                const SizedBox.shrink(),
                          ),
                        ),
                        SizedBox(width: 8.h),
                        RegularText(
                          e.name!,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                        SizedBox(width: 6.h),
                        InkWell(
                          onTap: () {
                            selectedCountries.removeWhere(
                                (element) => element.name == e.name);
                            setState(() {});
                          },
                          child: Icon(
                            Icons.close,
                            size: 14.h,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              InkWell(
                onTap: () async {
                  dynamic data = await showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.h),
                      topRight: Radius.circular(20.h),
                    )),
                    builder: (context) {
                      return SearchCountry(
                          selectedCountries: selectedCountries);
                    },
                  );
                  if (data != null) {
                    selectedCountries = data;
                    setState(() {});
                  }
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.h),
                    border: Border.all(color: AppColors.lightGrey),
                  ),
                  child: RegularText(
                    'See more',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.skyBlue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          GeneralButton(
            'Show 20 results',
            buttonColor: AppColors.skyBlue,
            borderColor: AppColors.skyBlue,
            borderRadius: 8.h,
            fontSize: 14.sp,
            height: 50.h,
            textColor: AppColors.white,
            fontWeight: FontWeight.w600,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 8.h),
          GeneralButton(
            'Reset',
            buttonColor: AppColors.white,
            borderColor: AppColors.white,
            fontSize: 14.sp,
            height: 50.h,
            textColor: AppColors.skyBlue,
            fontWeight: FontWeight.w600,
            onPressed: () {
              selectedCountries.clear();
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
