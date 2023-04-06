import 'dart:async';

import 'package:flutter/material.dart';
import 'package:picsel_github/core/theme/colors.dart';
import 'package:picsel_github/core/theme/typography.dart';

class DefaultButton extends StatelessWidget {
  final String label;
  final FutureOr<void> Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final ButtonStyle? buttonStyle;
  final String? icon;
  final bool invertColors;
  final bool avoidOverflow;
  const DefaultButton(
      {required this.label,
      this.buttonStyle,
      this.avoidOverflow = false,
      required this.onPressed,
      this.invertColors = false,
      this.color,
      this.icon,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: avoidOverflow
          ? MediaQuery.of(context).size.width * .45
          : double.maxFinite,
      height: 56,
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  side: invertColors
                      ? BorderSide(
                          color: color ?? Colors.white,
                          width: 1,
                        )
                      : textColor != null
                          ? BorderSide(
                              color: textColor ?? AppColors.border, width: 1)
                          : BorderSide(color: AppColors.border),
                  borderRadius: BorderRadius.circular(5))),
              textStyle: MaterialStateProperty.all(h1.copyWith(
                  fontSize: 18,
                  color: invertColors ? Colors.white : AppColors.primary)),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (color != null) return color;
                if (invertColors) return AppColors.primary;
                if (states.contains(MaterialState.disabled)) {
                  return AppColors.secondary.withOpacity(.3);
                } else {
                  return AppColors.secondary;
                }
              })),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 8),
              Text(
                label,
                style: h2.copyWith(
                    fontSize: 18,
                    color: textColor ??
                        (invertColors ? Colors.white : AppColors.primary)),
              )
            ],
          )),
    );
  }
}
