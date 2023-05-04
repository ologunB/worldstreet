import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/choose_country_view.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/search_country.dart';
import '../widgets/utils.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.h),
        child: GeneralButton(
          'Update',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 16.sp,
          height: 48.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RegularText(
          'Account Information',
          fontSize: 18.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          CircleAvatar(
            radius: 23.h,
            backgroundColor: Color(0xff291CC0),
            child: Image.asset('assets/icons/person.png'),
          ),
          SizedBox(height: 30.h),
          WorldStreetField(
            labelText: 'Username/Tag',
            textInputType: TextInputType.text,
            maxLines: 1,
            validator: Utils.isValidPassword,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16.h),
          WorldStreetField(
            labelText: 'Name',
            textInputType: TextInputType.text,
            maxLines: 1,
            validator: Utils.isValidPassword,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 12.h),
          RegularText(
            'To change your name, contact\nsupport@useworldstreet.com',
            fontSize: 12.sp,
            color: AppColors.greyDark1,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 12.h),
          WorldStreetField(
            labelText: 'Email',
            textInputType: TextInputType.text,
            maxLines: 1,
            validator: Utils.validateEmail,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16.h),
          WorldStreetField(
            labelText: 'Date of Birth',
            textInputType: TextInputType.text,
            maxLines: 1,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16.h),
          InkWell(
            onTap: () async {
              dynamic c = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => ChooseCountryScreen(),
                    fullscreenDialog: true),
              );
              if (c != null) {
                selectedCountry = c;
                setState(() {});
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 12.h),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.h),
                  border: Border.all(color: AppColors.dGrey)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(38.h),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://flagcdn.com/160x120/${selectedCountry.code?.toLowerCase()}.png',
                      height: 20.h,
                      width: 20.h,
                      fit: BoxFit.fill,
                      placeholder: (_, __) => const SizedBox.shrink(),
                      errorWidget: (_, __, ___) => const SizedBox.shrink(),
                    ),
                  ),
                  SizedBox(width: 9.h),
                  RegularText(
                    selectedCountry.dialCode!,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                  SizedBox(width: 8.h),
                  Icon(Icons.keyboard_arrow_down_rounded),
                  Expanded(
                    child: CupertinoTextField(
                      decoration: BoxDecoration(color: Colors.transparent),
                      placeholder: '0000 0000 000',
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          InkWell(
            onTap: () async {
              dynamic c = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => ChooseCountryScreen(),
                    fullscreenDialog: true),
              );
              if (c != null) {
                selectedCountry = c;
                setState(() {});
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 16.h),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.h),
                  border: Border.all(color: AppColors.dGrey)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(38.h),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://flagcdn.com/160x120/${selectedCountry.code?.toLowerCase()}.png',
                      height: 20.h,
                      width: 20.h,
                      fit: BoxFit.fill,
                      placeholder: (_, __) => const SizedBox.shrink(),
                      errorWidget: (_, __, ___) => const SizedBox.shrink(),
                    ),
                  ),
                  SizedBox(width: 9.h),
                  Expanded(
                    child: RegularText(
                      selectedCountry.name!,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(width: 8.h),
                  Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Country selectedCountry =
      Country.fromJson({"name": "Nigeria", "dial_code": "+234", "code": "NG"});
}
