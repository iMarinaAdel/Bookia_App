import 'package:bookia/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppAssets.logoSvg, width: 99, height: 30),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: GestureDetector(child: SvgPicture.asset(AppAssets.search)),
          ),
        ],
      ),
    );
  }
}
