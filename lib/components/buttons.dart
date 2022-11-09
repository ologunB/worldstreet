import 'package:flutter/material.dart';
import 'package:ft_worldstreet/schema/color_schema.dart';
import 'package:ft_worldstreet/schema/text_style.dart';
import 'package:ft_worldstreet/utils/enum.dart';

class CommonAppButton extends StatelessWidget {
  final Function()? onTap;
  final ButtonType buttonType;

  final String? text;
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final TextStyle? style;
  final double? borderRadius;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;

  const CommonAppButton({
    Key? key,
    this.onTap,
    this.buttonType = ButtonType.disable,
    this.text,
    this.color,
    this.icon,
    this.height,
    this.textColor,
    this.style,
    this.borderRadius,
    this.width,
    this.boxShadow,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color background = AppColors.grey;
    switch (buttonType) {
      case ButtonType.enable:
        {
          background = AppColors.skyBlue;
        }
        break;
      case ButtonType.disable:
        {
          background = AppColors.grey.withOpacity(0.5);
        }
        break;
      case ButtonType.progress:
        break;
    }
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(borderRadius ?? 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 15),
        onTap: (buttonType == ButtonType.enable) ? (onTap ?? () {}) : () {},
        child: Container(
          height: height ?? 48,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
              border: border,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius ?? 15),
              boxShadow: boxShadow),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (buttonType == ButtonType.progress)
                const CircularProgressIndicator(),
              if (buttonType != ButtonType.progress)
                Center(
                  child: Text(
                    text!,
                    style: style ??
                        const TextStyle(fontFamily: 'inter')
                            .normal16w500
                            .textColor((buttonType == ButtonType.disable)
                                ? AppColors.skyBlue
                                : AppColors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
