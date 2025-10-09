import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var userData = LocalHelper.getUserData();
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: CachedNetworkImage(
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            imageUrl: userData?.image ?? "",
          ),
        ),
        Gap(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userData?.name ?? "",
              style: TextStyles.getText20(color: AppColor.darkColor),
            ),
            Text(
              userData?.email ?? "",
              style: TextStyles.getText14(color: AppColor.grayColor),
            ),
          ],
        ),
      ],
    );
  }
}
