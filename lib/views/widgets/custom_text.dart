import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:ft_worldstreet/schema/color_schema.dart';

class ItsyText extends StatelessWidget {
  const ItsyText(
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
  }) : super(key: key);

  final String text;
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
    TextStyle textStyle = GoogleFonts.inter(
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
