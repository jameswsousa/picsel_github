import 'package:flutter/material.dart';
import 'package:picsel_github/core/components/default_button.dart';
import 'package:picsel_github/core/components/loading_widget.dart';
import 'package:picsel_github/core/theme/colors.dart';
import 'package:picsel_github/core/theme/typography.dart';

import '../errors/failures.dart';

class DefaultAlertDialog {
  static Future showError({
    required BuildContext context,
    required Failure failure,
    final String? buttonText,
    final String? icon,
    final Function()? buttonAction,
  }) =>
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              insetPadding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 8),
                    Container(
                      width: 225,
                      child: Text(
                        failure.title,
                        textAlign: TextAlign.center,
                        style:
                            h3.copyWith(fontSize: 24, color: AppColors.primary),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: 225,
                      child: Text(
                        failure.message,
                        textAlign: TextAlign.center,
                        style: h3.copyWith(
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    if (buttonText != null)
                      Column(
                        children: [
                          SizedBox(height: 40),
                          DefaultButton(
                            label: buttonText,
                            onPressed: buttonAction,
                          ),
                        ],
                      ),
                  ],
                ),
              )));
  static Future showLoading(
          {required BuildContext context, bool barrierDismissible = false}) =>
      showDialog(
          context: context,
          barrierDismissible: barrierDismissible,
          builder: (context) => LoadingWidget());
  static Future show(
          {required BuildContext context,
          bool barrierDismissible = false,
          bool withPadding = true,
          Color? color,
          required Widget body}) =>
      showDialog(
          context: context,
          barrierDismissible: barrierDismissible,
          builder: (context) {
            return Dialog(
              backgroundColor: color,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: withPadding ? EdgeInsets.all(16) : null,
                child: body,
              ),
            );
          });
}
