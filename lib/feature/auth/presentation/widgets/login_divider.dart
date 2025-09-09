import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColor.grayColor,
            thickness: 1,
            indent: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Or Login with",
            style: TextStyles.getText16(color: AppColor.primaryColor),
          ),
        ),
        Expanded(
          child: Divider(
            color: AppColor.grayColor,
            thickness: 1,
            endIndent: 20,
          ),
        ),
      ],
    );
  }
}
