import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/extentions/dailogs.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/home_states.dart';
import 'package:bookia/feature/home/presentation/home/widgets/all_product_list.dart';
import 'package:bookia/feature/home/presentation/home/widgets/best_sellers_list.dart';
import 'package:bookia/feature/home/presentation/home/widgets/home_slider.dart';
import 'package:bookia/feature/home/presentation/home/widgets/new_arrivals_list.dart';
import 'package:bookia/routes/app_navigation.dart';
import 'package:bookia/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return HomeCubit()..getHomeData();
      },
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(AppAssets.logoSvg, width: 99, height: 30),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                child: SvgPicture.asset(AppAssets.searchSvg),
                onTap: () {
                  pushTo(context, Routes.search);
                },
              ),
            ),
          ],
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          builder: (BuildContext context, state) {
            var cubit = context.read<HomeCubit>();
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeSlider(sliders: cubit.sliders),
                    Gap(15),
                    BestSellersList(products: cubit.bestSeller),
                    Gap(15),
                    NewArrivalsList(products: cubit.newArrvils),
                    Gap(15),
                    AllProductList(products: cubit.allProduct),
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, HomeState state) {
            if (state is HomeLoadingState) {
              Dialogs.showLoadingDialog(context);
            } else if (state is HomeLoadedState) {
              // Dialogs.hideLoadingDialog(context);
            } else if (state is HomeErrorState) {
              Dialogs.showErrorDialog(
                context,
                state.message ?? "faild to load data",
              );
            }
          },
        ),
      ),
    );
  }
}
