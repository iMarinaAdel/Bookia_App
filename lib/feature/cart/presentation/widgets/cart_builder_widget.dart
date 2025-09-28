import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_states.dart';
import 'package:bookia/feature/cart/presentation/widgets/cart_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';

class CartBuilderWidget extends StatelessWidget {
  const CartBuilderWidget({super.key, required this.cubit});
  final CartCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CarStates>(
      builder: (context, state) {
        var cubit = context.read<CartCubit>();
        if (cubit.cartItems.isEmpty) {
          return Column(
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
                  style: TextStyles.getText20(color: AppColor.darkColor),
                ),
              ),
            ],
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return CartCardWidget(
              cartItem: cubit.cartItems[index],
              onRemove: () {
                cubit.removeFromCart(cubit.cartItems[index].itemId ?? 0);
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
        );
      },
    );
  }
}
