import 'package:flutter/material.dart';

import 'custom_text.dart';

class GeneralButton extends StatefulWidget {
  const GeneralButton(this.text,
      {Key? key,
      this.buttonColor,
      this.textColor,
      this.onTap,
      this.borderColor,
      this.fontWeight,
      this.fontSize,
      this.horiMargin,
      this.borderRadius,
      this.icon,
      this.iconColor,
      this.height,
      this.width,
      this.busy = false,
      this.isActive = true})
      : super(key: key);

  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final Function()? onTap;
  final Color? borderColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? horiMargin;
  final double? borderRadius;
  final String? icon;
  final Color? iconColor;
  final double? height;
  final double? width;
  final bool busy;
  final bool isActive;

  @override
  State<GeneralButton> createState() => _GeneralButtonState();
}

class _GeneralButtonState extends State<GeneralButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: widget.isActive ? (widget.busy ? null : widget.onTap) : null,
        child: Container(
          height: widget.height,
          width: widget.width,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: widget.horiMargin ?? 0),
          decoration: BoxDecoration(
              color: widget.isActive
                  ? widget.buttonColor
                  : widget.buttonColor!.withOpacity(.6),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 4.h),
              border: Border.all(
                  width: 1.h,
                  color: widget.isActive
                      ? (widget.borderColor ?? Colors.transparent)
                      : const Color(0xffF6F6F6))),
          child: Center(
            child: widget.busy
                ? SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 3.h,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(AppColors.white),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.icon != null)
                        Padding(
                          padding: EdgeInsets.only(right: 12.h),
                          child: Image.asset(
                            'assets/images/${widget.icon}.png',
                            height: 24.h,
                            width: 24.h,
                            color: widget.iconColor,
                          ),
                        ),
                      RegularText(
                        widget.text,
                        color: widget.isActive
                            ? widget.textColor
                            : widget.textColor!.withOpacity(.6),
                        fontSize: widget.fontSize,
                        fontFamily: 'Poppins',
                        fontWeight: widget.fontWeight ?? FontWeight.w600,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
