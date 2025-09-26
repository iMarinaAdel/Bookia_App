import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:bookia/feature/wishlist/presentation/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WishlistBuilder extends StatelessWidget {
  const WishlistBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistStates>(
      builder: (BuildContext context, state) {
        var cubit = context.read<WishlistCubit>();
        if (cubit.products.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.bookmarkSvg,
                  height: 100,
                  colorFilter: ColorFilter.mode(
                    AppColor.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                Gap(20),
                Text(
                  "No items in wishlist",
                  style: TextStyles.getText20(color: AppColor.darkColor),
                ),
              ],
            ),
          );
        }
        return ListView.separated(
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return WishlistCard(
              product: cubit.products[index],
              onRemove: () {
                cubit.removeWishList(cubit.products[index].id ?? 0);
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(color: AppColor.grayColor);
          },
          itemCount: cubit.products.length,
        );
      },
    );
  }
}
