import 'package:bookia/core/components/bottoms/app_main_bottom.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({super.key, required this.product, this.onRemove});
  final Product product;
  final VoidCallback? onRemove;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: product.image ?? "",
              height: 120,
              width: 100,
            ),
          ),
          Gap(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        product.name ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.getText16(color: AppColor.darkColor),
                      ),
                    ),
                    Gap(5),
                    GestureDetector(
                      onTap: onRemove,
                      child: SvgPicture.asset(AppAssets.closeSvg),
                    ),
                  ],
                ),
                Gap(5),
                Text(
                  " \$${product.price ?? ""}",
                  style: TextStyles.getText16(color: AppColor.darkColor),
                ),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppMainBottom(
                      onPressed: () {},
                      text: "Add To Cart",
                      bottomWidth: 180,
                      bottomHight: 40,
                      radias: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
