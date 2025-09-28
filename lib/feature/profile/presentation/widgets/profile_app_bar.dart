import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Profile',
        style: TextStyles.getText26(color: AppColor.darkColor),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(AppAssets.logOut, height: 24, width: 24),
          onPressed: () {
            // Handle logout button press
          },
        ),
      ],
    );
  }
}
