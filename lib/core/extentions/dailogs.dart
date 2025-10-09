import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:lottie/lottie.dart';

class Dialogs {
  static showLoadingDialog(BuildContext context, [String? message]) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(color: AppColor.primaryColor),
                const Gap(15),
                if (message != null) Text(message),
              ],
            ),
          ),
        );
      },
    );
  }

  static showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(AppAssets.successJ, width: 60, height: 60),
                const Gap(15),
                Text(
                  message,
                  style: TextStyles.getText16(color: AppColor.darkColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error, color: Colors.red, size: 60),
              const SizedBox(height: 15),
              Text(message),
            ],
          ),
        );
      },
    );
  }

  static showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 1),
        content: Text(message),
        backgroundColor: AppColor.primaryColor,
      ),
    );
  }

  static hideLoadingDialog(BuildContext context) {
    popTo(context);
  }
}
