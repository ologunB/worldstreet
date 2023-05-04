import 'package:flutter/material.dart';

import 'custom_text.dart';

class PinKeyboard extends StatefulWidget {
  final double space;
  final int length;
  final void Function(String)? onChange;
  final void Function(String)? onConfirm;
  final VoidCallback? onBiometric;

  const PinKeyboard({
    this.space = 50,
    this.length = 4,
    this.onChange,
    this.onConfirm,
    this.onBiometric,
  });

  @override
  _PinKeyboardState createState() => _PinKeyboardState();
}

class _PinKeyboardState extends State<PinKeyboard> {
  String _pinCode = "";
  int? length;

  @override
  void initState() {
    length = widget.length + 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.h), color: AppColors.baground),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _createNumber("1", _handleTabNumber),
              Spacer(),
              _createNumber("2", _handleTabNumber),
              Spacer(),
              _createNumber("3", _handleTabNumber),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createNumber("4", _handleTabNumber),
              Spacer(),
              _createNumber("5", _handleTabNumber),
              Spacer(),
              _createNumber("6", _handleTabNumber),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createNumber("7", _handleTabNumber),
              Spacer(),
              _createNumber("8", _handleTabNumber),
              Spacer(),
              _createNumber("9", _handleTabNumber),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createBiometricIcon(),
              Spacer(),
              _createNumber("0", _handleTabNumber),
              Spacer(),
              _createBackspaceIcon(),
            ],
          ),
        ],
      ),
    );
  }

  _createNumber(String number, void Function(String) onPress) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.space.h),
      ),
      child: Container(
        height: widget.space.h,
        width: widget.space.h,
        child: Center(
          child: RegularText(
            number,
            fontSize: 25.sp,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onTap: () {
        onPress(number);
      },
    );
  }

  Widget _createImage(Widget icon, void Function() onPress) => InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.space.h),
        ),
        child: Container(
          height: widget.space.h,
          width: widget.space.h,
          child: Center(child: icon),
        ),
        onTap: onPress,
      );

  void _handleTabNumber(String number) {
    if (_pinCode.length + 1 == length) {
      return;
    }
    if (widget.onChange == null || widget.onConfirm == null) return;
    if (_pinCode.length < length!) {
      _pinCode += number;
      widget.onChange!(_pinCode);
      if (_pinCode.length == length) {
        widget.onConfirm!(_pinCode);
        _pinCode = "";
      }
    }
  }

  void _handleTabBackspace() {
    if (_pinCode.length > 0) {
      _pinCode = _pinCode.substring(0, _pinCode.length - 1);
      if (widget.onChange != null) {
        widget.onChange!(_pinCode);
      }
    }
  }

  Widget _createBiometricIcon() {
    return SizedBox(width: 50.h);
  }

  Widget _createBackspaceIcon() {
    return _createImage(
      Container(
        height: widget.space.h,
        width: widget.space.h,
        child: Icon(
          Icons.backspace_outlined,
          size: 20.h,
          color: AppColors.black,
        ),
      ),
      _handleTabBackspace,
    );
  }
}
