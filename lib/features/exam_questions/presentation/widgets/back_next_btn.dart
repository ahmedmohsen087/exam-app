import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class BackNextBtn extends StatelessWidget {
  Color borderColor;
  Color backgroundColor;
  String text;
  Color textColor;
  void Function()? onPress;

  BackNextBtn({
    required this.backgroundColor,
    required this.borderColor,
    required this.text,
    required this.textColor,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadiusGeometry.all(Radius.circular(10)),
          ),
        ),
        padding: WidgetStatePropertyAll(
          EdgeInsetsGeometry.symmetric(vertical: 14, horizontal: 64.5),
        ),
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
      ),
      onPressed: onPress,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
