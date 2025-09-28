import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/profile/presentation/models/profile_item_model.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final ProfileItemModel item;
  const ProfileListTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => item.onTap(context),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.title,
              style: TextStyles.getText16(color: AppColor.darkColor),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: AppColor.grayColor),
          ],
        ),
      ),
    );
  }
}
