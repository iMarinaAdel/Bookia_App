import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: CachedNetworkImage(
                width: 121,
                height: 121,
                fit: BoxFit.cover,
                imageUrl: LocalHelper.getUserData()?.image ?? "",
              ),
            ),
            Positioned(
              bottom: -5,
              right: -5,
              child: IconButton(
                onPressed: () {},
                icon: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.whiteColor,
                  ),

                  child: SvgPicture.asset(AppAssets.cameraSvg),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
