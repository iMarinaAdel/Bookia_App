import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/feature/cart/presentation/cubit/cart_states.dart';
import 'package:bookia/feature/cart/presentation/widgets/cart_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "My Cart",
                style: TextStyles.getText26(color: AppColor.darkColor),
              ),
            ),
            body: 
            
            CartBuilderWidget(cubit: cubit),
          );
        },
        listener: (BuildContext context, state) {},
      ),
    );
  }
}
