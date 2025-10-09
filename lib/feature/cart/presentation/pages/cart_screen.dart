import 'package:bookia/core/components/bottoms/app_main_bottom.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_states.dart';
import 'package:bookia/feature/cart/presentation/widgets/cart_card_widget.dart';
import 'package:bookia/core/routes/app_navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (BuildContext context) {
        return CartCubit()..getCart();
      },
      child: BlocConsumer<CartCubit, CarStates>(
        builder: (BuildContext context, state) {
          var cubit = context.read<CartCubit>();
          double total = 0;
          for (var item in cubit.cartItems) {
            double price =
                double.tryParse(
                  item.itemProductPriceAfterDiscount.toString(),
                ) ??
                0.0;
            int quantity = item.itemQuantity ?? 1;
            total += price * quantity;
          }

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "My Cart",
                style: TextStyles.getText26(color: AppColor.darkColor),
              ),
            ),
            body: cubit.cartItems.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_shopping_cart,
                        size: 90,
                        color: AppColor.primaryColor,
                      ),
                      Gap(20),
                      Center(
                        child: Text(
                          "Your cart is empty",
                          style: TextStyles.getText20(
                            color: AppColor.darkColor,
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(20),
                          itemBuilder: (context, index) {
                            return CartCardWidget(
                              cartItem: cubit.cartItems[index],
                              onRemove: () {
                                cubit.removeFromCart(
                                  cubit.cartItems[index].itemId ?? 0,
                                );
                              },
                              onIncrease: () {
                                final item = cubit.cartItems[index];
                                cubit.updateCart(
                                  item.itemId ?? 0,
                                  (item.itemQuantity ?? 1) + 1,
                                );
                              },
                              onDecrease: () {
                                final item = cubit.cartItems[index];
                                if ((item.itemQuantity ?? 1) > 1) {
                                  cubit.updateCart(
                                    item.itemId ?? 0,
                                    (item.itemQuantity ?? 1) - 1,
                                  );
                                }
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              indent: 10,
                              endIndent: 10,
                              color: AppColor.grayColor.withValues(alpha: 0.5),
                            );
                          },
                          itemCount: cubit.cartItems.length,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total:",
                              style: TextStyles.getText20(
                                color: AppColor.darkColor,
                              ),
                            ),
                            Text(
                              "\$${total.toStringAsFixed(2)}",
                              style: TextStyles.getText20(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppMainBottom(
                        onPressed: () {
                          pushTo(
                            context,
                            Routes.placeOrder,
                            extra: total.toStringAsFixed(2),
                          );
                        },
                        text: "Checkout",
                      ),
                    ],
                  ),
          );
        },
        listener: (BuildContext context, state) {},
      ),
    );
  }
}
