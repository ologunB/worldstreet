import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:ft_worldstreet/utils/color_schema.dart';

class RegularText extends StatelessWidget {
  const RegularText(
    this.text, {
    Key? key,
    this.color,
    this.letterSpacing,
    this.height,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.fontWeight,
    this.blur = false,
    this.fontSize = 14,
    this.onTap,
    this.fontFamily,
  }) : super(key: key);

  final String text;
  final String? fontFamily;
  final Color? color;
  final double? fontSize;
  final double? letterSpacing;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final bool blur;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = fontFamily == 'Gilroy'
        ? TextStyle(
            fontFamily: fontFamily,
            color: color,
            letterSpacing: letterSpacing,
            fontSize: fontSize,
            height: height,
            fontWeight: fontWeight,
            decoration: decoration,
          )
        : fontFamily == 'Poppins'
            ? GoogleFonts.poppins(
                color: color,
                letterSpacing: letterSpacing,
                fontSize: fontSize,
                height: height,
                fontWeight: fontWeight,
                decoration: decoration,
              )
            : GoogleFonts.inter(
                color: color,
                letterSpacing: letterSpacing,
                fontSize: fontSize,
                height: height,
                fontWeight: fontWeight,
                decoration: decoration,
              );
    return InkWell(
      onTap: onTap,
      child: Text(text,
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: overflow,
          softWrap: true,
          style: textStyle),
    );
  }
}
