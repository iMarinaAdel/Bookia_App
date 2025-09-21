import 'package:bookia/components/inputs/search._field.dart';
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
            body: BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state) {
                var cubit = context.read<SearchCubit>();
                return ProductOfSearch(products: cubit.products);
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
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 280,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return BookCardWidget(product: products[index]);
            },
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
