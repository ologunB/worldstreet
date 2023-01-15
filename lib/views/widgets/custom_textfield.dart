import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_text.dart';

class WorldStreetField extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? title;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Function(String?)? onChanged;
  final Function()? onTap;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool? enabled;
  final bool obscureText;
  final bool isEditProfile;
  final String? authPrefix;
  final bool autoFocus;
  final FocusNode? focusNode;
  final String? obscuringCharacter;
  final List<TextInputFormatter>? inputFormatters;

  const WorldStreetField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.hintText,
    this.textInputAction,
    this.textInputType,
    this.textAlign,
    this.onChanged,
    this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter,
    this.maxLines = 1,
    this.onTap,
    this.autoFocus = false,
    this.focusNode,
    this.maxLength,
    this.title,
    this.enabled,
    this.suffix,
    this.inputFormatters,
    this.isEditProfile = false,
    this.authPrefix,
  });

  @override
  State<WorldStreetField> createState() => _WorldStreetFieldState();
}

class _WorldStreetFieldState extends State<WorldStreetField> {
  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Focus(
        onFocusChange: (hasFocus) {
          _hasFocus = hasFocus;
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.title != null)
                Row(
                  mainAxisAlignment:
                      (widget.title == 'To' || widget.title == 'From')
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 6.h),
                      child: RegularText(
                        widget.title!,
                        fontSize: 12.sp,
                        color: _hasFocus ? AppColors.primary : AppColors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              TextFormField(
                cursorColor: AppColors.black.withOpacity(0.4),
                cursorWidth: 1.h,
                focusNode: widget.focusNode,
                maxLines: widget.maxLines,
                autofocus: widget.autoFocus,
                enabled: widget.enabled ?? true,
                maxLength: widget.maxLength,
                inputFormatters: widget.inputFormatters,
                textInputAction: widget.textInputAction,
                style: GoogleFonts.inter(
                  color: AppColors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
                readOnly: widget.readOnly,
                decoration: InputDecoration(
                  counterText: '',
                  contentPadding: EdgeInsets.all(15.h),
                  hintText: widget.hintText,
                  hintStyle: GoogleFonts.inter(
                    color: AppColors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  errorStyle: GoogleFonts.inter(
                    color: AppColors.red,
                    fontSize: 10.5.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: widget.authPrefix != null
                      ? SizedBox(
                          width: 40.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/${widget.authPrefix}.png',
                                height: 16.h,
                                width: 16.h,
                                //  color: AppColors.black,
                              )
                            ],
                          ),
                        )
                      : widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  suffix: widget.suffix,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.grey,
                      width: 1.h,
                    ),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.grey,
                      width: 1.h,
                    ),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.red,
                      width: 1.h,
                    ),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.red,
                      width: 1.h,
                    ),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.grey,
                      width: 1.h,
                    ),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.grey,
                      width: 1.h,
                    ),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                ),
                obscureText: widget.obscureText,
                onTap: widget.onTap,
                obscuringCharacter: '●',
                controller: widget.controller,
                textAlign: widget.textAlign ?? TextAlign.start,
                keyboardType: widget.textInputType,
                validator: widget.validator,
                onChanged: widget.onChanged,
              )
            ],
          ),
        ),
      ),
    );
  }
}
