import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_text.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<String> list;
  final void Function(String?)? onChanged;
  final String? value;
  final String hintText;
  final String? title;

  CustomDropDownButton(
      {required this.list,
      this.onChanged,
      required this.value,
      required this.hintText,
      this.title});

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: EdgeInsets.only(bottom: 6.h),
            child: RegularText(widget.title!,
                fontSize: 12.sp, color: AppColors.black),
          ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 6.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.h),
              border: Border.all(
                width: 1.h,
                color: AppColors.grey,
              )),
          height: 50.h,
          alignment: Alignment.center,
          child: DropdownButton<String>(
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
            isExpanded: true,
            hint: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Text(
                widget.hintText,
                style: GoogleFonts.inter(
                  color: AppColors.grey,
                  fontSize: 14.sp,
                ),
              ),
            ),
            value: widget.value,
            underline: SizedBox(),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.darkBlue,
              size: 24.h,
            ),
            onChanged: widget.onChanged,
            items: widget.list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Text(
                    value,
                    style: GoogleFonts.inter(
                      color: AppColors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
