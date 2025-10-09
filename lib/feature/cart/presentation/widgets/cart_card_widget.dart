import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/cart/data/models/response/cart_response/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

class CartCardWidget extends StatelessWidget {
  const CartCardWidget({
    super.key,
    required this.cartItem,
    this.onRemove,
    this.onIncrease,
    this.onDecrease,
  });

  final CartItem cartItem;
  final VoidCallback? onRemove;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;

  @override
  Widget build(BuildContext context) {
    final price =
        double.tryParse(cartItem.itemProductPriceAfterDiscount.toString()) ??
        0.0;
    final quantity = cartItem.itemQuantity ?? 1;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: cartItem.itemProductImage ?? "",
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
                        cartItem.itemProductName ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.getText16(color: AppColor.darkColor),
                      ),
                    ),
                    GestureDetector(
                      onTap: onRemove,
                      child: SvgPicture.asset(AppAssets.closeSvg),
                    ),
                  ],
                ),
                Gap(5),
                Text(
                  "\$${(price * quantity).toStringAsFixed(2)}",
                  style: TextStyles.getText16(color: AppColor.darkColor),
                ),
                Gap(20),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: AppColor.primaryColor,
                        minimumSize: Size(40, 40),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: onIncrease,
                      child: Icon(Icons.add),
                    ),
                    Gap(10),
                    Text(
                      quantity.toString(),
                      style: TextStyles.getText18(color: AppColor.darkColor),
                    ),
                    Gap(10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: AppColor.primaryColor,
                        minimumSize: Size(40, 40),
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: onDecrease,
                      child: Icon(Icons.remove),
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
