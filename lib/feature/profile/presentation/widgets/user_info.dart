import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset(
            AppAssets.welcome,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: TextStyles.getText20(color: AppColor.darkColor),
            ),
            Text(
              "email@",
              style: TextStyles.getText14(color: AppColor.grayColor),
            ),
          ],
        ),
      ],
    );
  }
}
