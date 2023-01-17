import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/utils.dart';
import 'add_faceid_view.dart';
import 'choose_country_view.dart';

class VerifyIdentityScreen extends StatefulWidget {
  const VerifyIdentityScreen({Key? key}) : super(key: key);

  @override
  State<VerifyIdentityScreen> createState() => _VerifyIdentityScreenState();
}

class _VerifyIdentityScreenState extends State<VerifyIdentityScreen> {
  int? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.black),
        elevation: 0,
        backgroundColor: AppColors.white,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegularText(
                'Skip   ',
                fontSize: 14.sp,
                color: AppColors.grey,
              ),
            ],
          )
        ],
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
          onPressed: () async {
            final ImagePicker _picker = ImagePicker();
            final XFile? image =
                await _picker.pickImage(source: ImageSource.gallery);

            if (image != null) {
              push(context, AddFaceIDScreen());
            } else {
              // User canceled the picker
            }
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(24.h),
          children: [
            RegularText(
              'Verify identity',
              fontSize: 24.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 17.h),
            RegularText(
              'Select your document to verify your identity',
              fontSize: 14.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
              color: AppColors.grey,
            ),
            SizedBox(height: 40.h),
            RegularText(
              'Nationality',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 17.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 14.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.h),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    spreadRadius: 1,
                    color: AppColors.lightGrey,
                  )
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(38.h),
                    child: CachedNetworkImage(
                      imageUrl: 'https://flagcdn.com/160x120/ng.png',
                      height: 40.h,
                      width: 40.h,
                      fit: BoxFit.fill,
                      placeholder: (_, __) => const SizedBox.shrink(),
                      errorWidget: (_, __, ___) => const SizedBox.shrink(),
                    ),
                  ),
                  SizedBox(width: 8.h),
                  Expanded(
                    child: RegularText(
                      'Nigeria',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(width: 8.h),
                  InkWell(
                    onTap: () {
                      push(context, ChooseCountryScreen());
                    },
                    child: RegularText(
                      'change',
                      fontSize: 14.sp,
                      color: AppColors.skyBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            RegularText(
              'Choose verification method',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 24.h),
            ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      type = i;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.h, vertical: 14.h),
                      margin: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12.h),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 6,
                            spreadRadius: 1,
                            color: AppColors.lightGrey,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/icons/i$i.png', height: 24.h),
                          SizedBox(width: 8.h),
                          Expanded(
                            child: RegularText(
                              list[i],
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(width: 8.h),
                          type == i
                              ? Icon(
                                  Icons.radio_button_checked,
                                  color: AppColors.skyBlue,
                                )
                              : Icon(
                                  Icons.radio_button_off,
                                  color: AppColors.grey,
                                )
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  List<String> get list => [
        'National Identity Card',
        'International Passport',
        'Driver’s license',
      ];
}
