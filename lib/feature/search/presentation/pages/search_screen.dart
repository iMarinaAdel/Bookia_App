import 'package:bookia/components/inputs/search._field.dart';
import 'package:bookia/extentions/dailogs.dart';
import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:bookia/feature/home/presentation/widgets/book_card_widget.dart';
import 'package:bookia/feature/search/presentation/cubit/search_cubit.dart';
import 'package:bookia/feature/search/presentation/cubit/search_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: SearchBarWidget(),
              automaticallyImplyLeading: false,
            ),
            body: BlocConsumer<SearchCubit, SearchStates>(
              listener: (context, state) {
                if (state is SearchLoading) {
                  Dialogs.showLoadingDialog(context);
                } else {
                  Dialogs.hideLoadingDialog(context);
                }
              },
              builder: (context, state) {
                var cubit = context.watch<SearchCubit>();
                if (state is SearchSuccess) {
                  return ProductOfSearch(products: cubit.products);
                } else if (state is SearchEmpty) {
                  return const Center(child: Text("لا يوجد نتائج للبحث"));
                } else if (state is SearchError) {
                  return const Center(child: Text("حدث خطأ، حاول مرة أخرى"));
                } else {
                  return const Center(child: Text("ابحث عن كتاب من هنا 🔍"));
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductOfSearch extends StatelessWidget {
  const ProductOfSearch({super.key, required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 280,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return BookCardWidget(product: products[index]);
      },
      itemCount: products.length,
    );
  }
}
