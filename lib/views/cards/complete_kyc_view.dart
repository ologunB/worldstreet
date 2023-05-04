import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../auth/choose_country_view.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/search_country.dart';
import '../widgets/utils.dart';
import 'add_fund_create_card.dart';

class CompleteKYCScreen extends StatefulWidget {
  const CompleteKYCScreen({Key? key}) : super(key: key);

  @override
  State<CompleteKYCScreen> createState() => _CompleteKYCScreenState();
}

class _CompleteKYCScreenState extends State<CompleteKYCScreen> {
  String? title, gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baground,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.h),
        child: GeneralButton(
          'Continue',
          buttonColor: AppColors.skyBlue,
          borderColor: AppColors.skyBlue,
          borderRadius: 8.h,
          fontSize: 16.sp,
          height: 50.h,
          textColor: AppColors.white,
          fontWeight: FontWeight.w500,
          onPressed: () {
            push(context, AddFundCreateCardScreen());
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RegularText(
          'Complete your KYC to\ncreate Card',
          fontSize: 18.sp,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(24.h),
        children: [
          SizedBox(height: 24.h),
          WorldStreetField(
            hintText: 'BVN',
            textInputType: TextInputType.number,
            maxLines: 1,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.h),
                border: Border.all(
                  width: 1.h,
                  color: AppColors.dGrey,
                )),
            height: 52.h,
            alignment: Alignment.center,
            child: DropdownButton<String>(
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontSize: 14.h),
              isExpanded: true,
              hint: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Text(
                  'Title',
                  style: GoogleFonts.poppins(
                    color: AppColors.grey,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              value: title,
              underline: SizedBox(),
              icon: Padding(
                padding: EdgeInsets.only(right: 12.h),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.greyDark1,
                  size: 24.h,
                ),
              ),
              onChanged: (a) {
                title = a;
                setState(() {});
              },
              items: ['MR', 'MRS', 'MISS']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.h),
                    child: Text(
                      value,
                      style: GoogleFonts.poppins(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.h),
                border: Border.all(
                  width: 1.h,
                  color: AppColors.dGrey,
                )),
            height: 52.h,
            alignment: Alignment.center,
            child: DropdownButton<String>(
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  fontSize: 14.h),
              isExpanded: true,
              hint: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Text(
                  'Gender',
                  style: GoogleFonts.poppins(
                    color: AppColors.grey,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              value: gender,
              underline: SizedBox(),
              icon: Padding(
                padding: EdgeInsets.only(right: 12.h),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.greyDark1,
                  size: 24.h,
                ),
              ),
              onChanged: (a) {
                gender = a;
                setState(() {});
              },
              items: ['MALE', 'FEMALE']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.h),
                    child: Text(
                      value,
                      style: GoogleFonts.poppins(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16.h),
          InkWell(
            onTap: () {
              chooseDob(context);
            },
            child: WorldStreetField(
              labelText: 'Date of Birth',
              textInputType: TextInputType.text,
              maxLines: 1,
              controller: dobController,
              readOnly: true,
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.keyboard_arrow_down_rounded, size: 24.h)],
              ),
              textInputAction: TextInputAction.next,
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
                      style: GoogleFonts.poppins(
                        color: AppColors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
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
  DateTime? startDate;
  TextEditingController dobController = TextEditingController();

  Future<void> chooseDob(BuildContext context) async {
    Utils.unfocusKeyboard(context);
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1980),
      currentTime: startDate ?? DateTime(1995),
      maxTime: DateTime.now().subtract(Duration(days: 3600)),
      onChanged: (date) {
        startDate = date;
        dobController.text = DateFormat('dd MMM, yyyy').format(date);
        setState(() {});
      },
      onConfirm: (date) {
        startDate = date;
        dobController.text = DateFormat('dd MMM, yyyy').format(date);
        setState(() {});
      },
    );
  }
}
