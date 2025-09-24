import 'package:bookia/feature/home/data/models/response/book_list_respose/product.dart';
import 'package:bookia/feature/home/presentation/details/widgets/details_app_bar.dart';
import 'package:bookia/feature/home/presentation/details/widgets/details_body.dart';
import 'package:bookia/feature/home/presentation/details/widgets/details_bottom_bar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.products});
  final Product products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailsAppBar(),
      bottomNavigationBar: DetailsBottomBar(products: products),
      body: DetailsBody(products: products),
    );
  }
}
