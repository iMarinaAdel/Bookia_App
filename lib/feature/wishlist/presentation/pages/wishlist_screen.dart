import 'package:bookia/core/extentions/dailogs.dart';
import 'package:bookia/core/utils/app_color.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:bookia/feature/wishlist/presentation/widgets/wishlist_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WishlistCubit()..getWishList(),
      child: BlocConsumer<WishlistCubit, WishlistStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Wishlist",
                style: TextStyles.getText26(color: AppColor.darkColor),
              ),
            ),
            body: WishlistBuilder(),
          );
        },
        listener: (BuildContext context, WishlistStates state) {
          if (state is AddToCartSuccess) {
            Dialogs.hideLoadingDialog(context);
            Dialogs.showSnackBar(
              context,
              state.message ?? "Added to cart successfully",
            );
          } else if (state is WishlistLoadingState) {
            Dialogs.showLoadingDialog(context);
          } else if (state is WishlistSuccess) {
            Dialogs.hideLoadingDialog(context);
          }
        },
      ),
    );
  }
}
