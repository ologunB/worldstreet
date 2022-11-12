import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';
import 'flutter_masked_text.dart';

class StakeField extends StatefulWidget {
  const StakeField(
      {Key? key,
      required this.title,
      required this.amountChanged,
      this.currencyChanged})
      : super(key: key);

  final String title;
  final Function(double) amountChanged;
  final Function(String)? currencyChanged;

  @override
  State<StakeField> createState() => _StakeFieldState();
}

class _StakeFieldState extends State<StakeField> {
  MoneyMaskedTextController amount = MoneyMaskedTextController(
    decimalSeparator: ".",
    thousandSeparator: ",",
    initialValue: 0.00,
  );
  String? currency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        children: [
          Row(
            children: [
              RegularText(
                widget.title,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  amount.updateValue(0);
                  widget.amountChanged(0);
                  setState(() {});
                },
                child: RegularText(
                  'Clear',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: amount.numberValue == 0
                      ? AppColors.grey
                      : AppColors.skyBlue,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: 40.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8.h),
                    border: Border.all(color: AppColors.grey),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (amount.numberValue > 1) {
                            amount.updateValue(amount.numberValue - 1);
                          } else {
                            amount.updateValue(0);
                          }
                          widget.amountChanged(amount.numberValue);
                          setState(() {});
                        },
                        child: Icon(
                          Icons.remove_rounded,
                          color: AppColors.grey,
                          size: 24.h,
                        ),
                      ),
                      Expanded(
                        child: CupertinoTextField(
                          controller: amount,
                          maxLength: 12,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.white),
                            borderRadius: BorderRadius.circular(8.h),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (amount.numberValue >= 0) {
                            amount.updateValue(amount.numberValue + 1);
                          } else {
                            amount.updateValue(0);
                          }
                          widget.amountChanged(amount.numberValue);
                          setState(() {});
                        },
                        child: Icon(
                          Icons.add_rounded,
                          color: AppColors.grey,
                          size: 24.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.currencyChanged != null)
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40.h,
                    margin: EdgeInsets.only(left: 12.h),
                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8.h),
                      border: Border.all(color: AppColors.grey),
                    ),
                    child: DropdownButton<String>(
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.grey,
                        size: 18.h,
                      ),
                      hint: RegularText(
                        'currency',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                      elevation: 0,
                      value: currency,
                      isExpanded: true,
                      underline: Container(),
                      items: <String>['USD', 'NGN', 'EUR'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: RegularText(
                            value,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        );
                      }).toList(),
                      onChanged: (a) {
                        currency = a;
                        widget.currencyChanged!(currency!);
                        setState(() {});
                      },
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
