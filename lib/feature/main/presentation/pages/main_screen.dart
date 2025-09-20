import 'package:bookia/constants/app_assets.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/feature/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.home),
            activeIcon: SvgPicture.asset(
              AppAssets.home,
              colorFilter: ColorFilter.mode(
                AppColor.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.bookmarkSvg),
            activeIcon: SvgPicture.asset(
              AppAssets.bookmarkSvg,
              colorFilter: ColorFilter.mode(
                AppColor.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "WishList",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.categorySvg),
            activeIcon: SvgPicture.asset(
              AppAssets.categorySvg,
              colorFilter: ColorFilter.mode(
                AppColor.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppAssets.profileSvg),
            activeIcon: SvgPicture.asset(
              AppAssets.profileSvg,
              colorFilter: ColorFilter.mode(
                AppColor.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
