import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_states.dart';
import 'package:bookia/feature/cart/presentation/widgets/cart_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBuilderWidget extends StatelessWidget {
  const CartBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CarStates>(
      builder: (context, state) {
        var cubit = context.watch<CartCubit>();
        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return CartCardWidget(
              cartItem: cubit.cartItems[index],
              onRemove: () {
                cubit.removeFromCart(cubit.cartItems[index].itemProductId ?? 0);
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
