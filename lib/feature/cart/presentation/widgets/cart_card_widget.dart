import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/cart/data/models/response/cart_response/cart_item.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

class CartCardWidget extends StatelessWidget {
  const CartCardWidget({super.key, required this.cartItem, this.onRemove});
  final CartItem cartItem;

  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CarStates>(
      builder: (context, state) {
        var cubit = context.read<CartCubit>();
        final price =
            double.tryParse(
              cartItem.itemProductPriceAfterDiscount.toString(),
            ) ??
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
                            style: TextStyles.getText16(
                              color: AppColor.darkColor,
                            ),
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
                      "\$${(price * quantity).toStringAsFixed(2)}",
                      style: TextStyles.getText16(color: AppColor.darkColor),
                    ),

                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                          onPressed: () {
                            cubit.updateCart(
                              cartItem.itemProductId ?? 0,
                              quantity + 1,
                            );
                          },
                          child: Icon(Icons.add),
                        ),
                        Gap(10),
                        Text(
                          cartItem.itemQuantity.toString(),
                          style: TextStyles.getText18(
                            color: AppColor.darkColor,
                          ),
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
                          onPressed: () {
                            if (quantity > 1) {
                              cubit.updateCart(
                                cartItem.itemProductId ?? 0,
                                quantity - 1,
                              );
                            }
                          },
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
      },
    );
  }
}
