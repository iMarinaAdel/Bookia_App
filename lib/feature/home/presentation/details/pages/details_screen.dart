import 'package:bookia/core/extentions/dailogs.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/home_states.dart';
import 'package:bookia/feature/home/presentation/details/widgets/details_app_bar.dart';
import 'package:bookia/feature/home/presentation/details/widgets/details_body.dart';
import 'package:bookia/feature/home/presentation/details/widgets/details_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.products});
  final Product products;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, state) {
        if (state is AddRemoveToWishListSuccess) {
          Dialogs.hideLoadingDialog(context);
          Dialogs.showSnackBar(context, state.message ?? "Success");
        } else if (state is HomeErrorState) {
          Dialogs.hideLoadingDialog(context);
          Dialogs.showSnackBar(context, state.message ?? "Error");
        } else if (state is HomeLoadingState) {
          Dialogs.showLoadingDialog(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: DetailsAppBar(products: products),
          bottomNavigationBar: DetailsBottomBar(products: products),
          body: DetailsBody(products: products),
        );
      },
    );
  }
}
