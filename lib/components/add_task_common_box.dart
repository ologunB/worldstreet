import 'package:flutter/material.dart';

////THIS CLASS MAKE FOR HOMESCREEN SHOW COMMON TASKBOX WHERE ALL TASK WILL SHOW
class AddTaskCommonBox extends StatelessWidget {
  final String? titleText;

  final Color? firstColor;
  final Color? secondColor;

  final Widget? child;

  const AddTaskCommonBox({
    Key? key,
    this.titleText,
    this.firstColor,
    this.secondColor,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 2),
          color: firstColor ?? Colors.red,
          child: Center(
            child: Text(
              titleText!,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Expanded(
          child: Container(
            color: secondColor ?? Colors.redAccent[100],
            child: child,
          ),
        ),
      ],
    );
  }
}
