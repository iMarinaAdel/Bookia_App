import 'dart:developer';

import 'package:bookia/core/extentions/dailogs.dart';
import 'package:bookia/core/services/local/local_helper.dart';
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
    log(LocalHelper.getUserData()?.token ?? "");
    return BlocProvider(
      create: (BuildContext context) {
        return WishlistCubit()..getWishList();
      },
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
          } else if (state is WishlistLoading) {
            Dialogs.showLoadingDialog(context);
          } else if (state is WishlistSuccess) {
            Dialogs.hideLoadingDialog(context);
          }
        },
      ),
    );
  }
}
