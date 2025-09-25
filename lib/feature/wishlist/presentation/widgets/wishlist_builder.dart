import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:bookia/feature/wishlist/presentation/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistBuilder extends StatelessWidget {
  const WishlistBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistStates>(
      builder: (BuildContext context, state) {
        var cubit = context.read<WishlistCubit>();
        return ListView.separated(
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return WishlistCard(product: cubit.products[index]);
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
