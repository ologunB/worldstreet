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
  final String? labelText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Function(String?)? onChanged;
  final Function()? onTap;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final double? fontSize;
  final bool obscureText;
  final bool? readOnly;
  final bool removeOutline;
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
    this.obscureText = false,
    this.obscuringCharacter,
    this.maxLines = 1,
    this.onTap,
    this.removeOutline = false,
    this.maxLength,
    this.suffix,
    this.inputFormatters,
    this.labelText,
    this.readOnly = false,
    this.fontSize,
  });

  @override
  State<WorldStreetField> createState() => _WorldStreetFieldState();
}

class _WorldStreetFieldState extends State<WorldStreetField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        maxLines: widget.maxLines,
        readOnly: widget.readOnly ?? false,
        enabled: !(widget.readOnly ?? false),
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.textInputAction,
        style: GoogleFonts.poppins(
          color: AppColors.black,
          fontSize: widget.fontSize ?? 14.sp,
          fontWeight:
              widget.fontSize == null ? FontWeight.w600 : FontWeight.w500,
        ),
        decoration: InputDecoration(
          counterText: '',
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(
            color: AppColors.grey,
            fontSize: widget.fontSize ?? 14.sp,
            fontWeight: FontWeight.w400,
          ),
          labelText: widget.labelText,
          labelStyle: GoogleFonts.poppins(
            color: AppColors.grey,
            fontSize: widget.fontSize ?? 14.sp,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.white,
          errorStyle: GoogleFonts.poppins(
            color: AppColors.red,
            fontSize: 10.5.sp,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          suffix: widget.suffix,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.removeOutline ? Colors.white : AppColors.dGrey,
              width: 1.h,
            ),
            borderRadius: BorderRadius.circular(12.h),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.removeOutline ? Colors.white : AppColors.dGrey,
              width: 1.h,
            ),
            borderRadius: BorderRadius.circular(12.h),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.removeOutline ? Colors.white : AppColors.dGrey,
              width: 1.h,
            ),
            borderRadius: BorderRadius.circular(12.h),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.removeOutline ? Colors.white : AppColors.dGrey,
              width: 1.h,
            ),
            borderRadius: BorderRadius.circular(12.h),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.removeOutline ? Colors.white : AppColors.dGrey,
              width: 1.h,
            ),
            borderRadius: BorderRadius.circular(12.h),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.removeOutline ? Colors.white : AppColors.dGrey,
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
      ),
    );
  }
}
