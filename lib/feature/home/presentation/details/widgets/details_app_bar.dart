import 'package:bookia/constants/app_assets.dart';
import 'package:bookia/feature/auth/presentation/widgets/arrow_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: ArrowBack(),
      actions: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(AppAssets.bookmarkSvg),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
